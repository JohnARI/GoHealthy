import { calculateBodyNeedsDto } from 'src/body-build/dto/calculate-body-needs.dto';
import { CreateBodyBuildDto } from 'src/body-build/dto/create-body-build.dto';

export function calculateNeeds(bodyBuild: CreateBodyBuildDto) {
  var result: calculateBodyNeedsDto = {
    calories: 0,
    proteins: 0,
    carbohydrates: 0,
    lipids: 0,
  };

  const sexeMap = new Map([
    ['FEMALE', -161],
    ['MALE', 5],
    ['OTHER', -78],
    ['NOT_SPECIFIED', -78],
  ]);

  const activityLevelMap = new Map([
    ['SEDENTARY', 1.2],
    ['LIGHTLY_ACTIVE', 1.375],
    ['MODERATELY_ACTIVE', 1.55],
    ['VERY_ACTIVE', 1.725],
    ['EXTREMELY_ACTIVE', 1.9],
  ]);

  const dietIntensityMap = new Map([
    ['FAST', 1100],
    ['MEDIUM', 550],
    [' SLOW', 275],
  ]);

  type diet = {
    carbohydrates: number;
    lipids: number;
    proteins: number;
  };

  const dietMap = new Map<string, diet>([
    ['LOWCARB', { carbohydrates: 0.3, lipids: 0.3, proteins: 0.4 }],
    ['LOWFAT', { carbohydrates: 0.45, lipids: 0.2, proteins: 0.35 }],
    ['HIGHPROTEIN', { carbohydrates: 0.32, lipids: 0.23, proteins: 0.45 }],
    ['STANDARD', { carbohydrates: 0.4, lipids: 0.25, proteins: 0.35 }],
  ]);

  result.calories = Math.floor(
    (10 * bodyBuild.currentWeight +
      6.25 * bodyBuild.height -
      5 * bodyBuild.age +
      sexeMap.get(bodyBuild.sexe)) *
      activityLevelMap.get(bodyBuild.activityLevel),
  );

  const mult = bodyBuild.weightGoal > bodyBuild.currentWeight ? 1 : -1;

  result.calories += mult * dietIntensityMap.get(bodyBuild.dietIntensity);

  result.proteins = Math.floor(
    (result.calories / 4) * dietMap.get(bodyBuild.diet).proteins,
  );
  result.carbohydrates = Math.floor(
    (result.calories / 4) * dietMap.get(bodyBuild.diet).carbohydrates,
  );
  result.lipids = Math.floor(
    (result.calories / 9) * dietMap.get(bodyBuild.diet).lipids,
  );

  return result;
}

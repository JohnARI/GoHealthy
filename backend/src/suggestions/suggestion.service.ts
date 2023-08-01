import { Injectable } from '@nestjs/common';
import { Meals, DailyNeeds } from '@prisma/client';
import axios from 'axios';
import { PrismaService } from 'src/prisma/prisma.service';

const API_URL = 'https://api.edamam.com/api/recipes';
axios.defaults.baseURL = API_URL;

@Injectable()
export class SuggestionService {
  constructor(private prismaService: PrismaService) {}

  async formatIngredients(body) {
    let wishedIngredients = '';
    let cuisineType = '';
    let diet = '';
    let excludedIngredients = '';

    body.excludedIngredients ? (excludedIngredients = '&excluded=') : '';
    body.wishedIngredients ? (wishedIngredients = '&wished=') : '';
    body.cuisineType ? (cuisineType = '&cuisineType=') : '';
    body.diet ? (diet = '&diet=') : '';

    if (Array.isArray(body.excludedIngredients)) {
      excludedIngredients += body.excludedIngredients.join(' ');
    }
    cuisineType += body.cuisineType;
    diet += body.diet;
    if (Array.isArray(body.wishedIngredients)) {
      wishedIngredients += body.wishedIngredients.join(' ');
    }

    return {
      wishedIngredients: encodeURI(wishedIngredients),
      cuisineType: encodeURI(cuisineType),
      diet: encodeURI(diet),
      excludedIngredients: encodeURI(excludedIngredients),
    };
  }

  async suggestBreakfast(needs: any, body: any) {
    try {
      const { protein, carb, lipid } = needs;

      const formatedIngredient = await this.formatIngredients(body);

      const { wishedIngredients, cuisineType, diet, excludedIngredients } =
        formatedIngredient;

      const req = await axios.get(
        `v2?type=public&app_id=${process.env.EDAMAM_APP_ID}&app_key=${process.env.EDAMAM_API_KEY}&mealType=breakfast&nutrients%5BCHOCDF.net%5D=${carb}&nutrients%5BFAT%5D=${lipid}&nutrients%5BPROCNT%5D=${protein}&field=image&field=images&field=url&field=ingredientLines&field=ingredients&field=totalNutrients${wishedIngredients}${cuisineType}${diet}${excludedIngredients}&imageSize=THUMBNAIL`,
      );
      return req.data;
    } catch (error) {
      console.log(error);
    }
  }

  async suggestLunch(needs: any, body: any) {
    try {
      const need = Promise.resolve(needs);
      const resolvedNeed = await need;

      const protein = resolvedNeed.protein;
      const lipid = resolvedNeed.lipid;
      const carb = resolvedNeed.carb;

      const formatedIngredient = await this.formatIngredients(body);

      const { wishedIngredients, cuisineType, diet, excludedIngredients } =
        formatedIngredient;

      const req = await axios.get(
        `v2?type=public&app_id=${process.env.EDAMAM_APP_ID}&app_key=${process.env.EDAMAM_API_KEY}&mealType=lunch&nutrients%5BCHOCDF.net%5D=${carb}&nutrients%5BFAT%5D=${lipid}&nutrients%5BPROCNT%5D=${protein}&field=image&field=images&field=url&field=ingredientLines&field=ingredients&field=totalNutrients${wishedIngredients}${cuisineType}${diet}${excludedIngredients}&imageSize=THUMBNAIL`,
      );
      return req.data;
    } catch (error) {
      console.log(error);
    }
  }

  async suggestDinner(needs: any, body: any) {
    try {
      const need = Promise.resolve(needs);
      const resolvedNeed = await need;

      const protein = resolvedNeed.protein;
      const lipid = resolvedNeed.lipid;
      const carb = resolvedNeed.carb;

      const formatedIngredient = await this.formatIngredients(body);

      const { wishedIngredients, cuisineType, diet, excludedIngredients } =
        formatedIngredient;

      const req = await axios.get(
        `v2?type=public&app_id=${process.env.EDAMAM_APP_ID}&app_key=${process.env.EDAMAM_API_KEY}&mealType=dinner&nutrients%5BCHOCDF.net%5D=${carb}&nutrients%5BFAT%5D=${lipid}&nutrients%5BPROCNT%5D=${protein}&field=image&field=images&field=url&field=ingredientLines&field=ingredients&field=totalNutrients${wishedIngredients}${cuisineType}${diet}${excludedIngredients}&imageSize=THUMBNAIL`,
      );

      return req.data;
    } catch (error) {
      console.log(error);
    }
  }

  async findUserDailyNeed(id: string) {
    const bodyBuild = await this.prismaService.bodyBuild.findUnique({
      where: { userId: id },
    });

    return await this.prismaService.dailyNeeds.findUnique({
      where: { bodyId: bodyBuild.id },
    });
  }

  async findUserDailyMealHistory(userId: string) {
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    const userMealsWithTodayDate = await this.prismaService.meals.findMany({
      where: {
        MealHistory: {
          some: {
            date: today,
            userId: userId,
          },
        },
      },
      include: {
        products: true,
      },
    });

    return userMealsWithTodayDate;
  }

  async calculateTotalNeeds(
    dailyNeed: DailyNeeds,
    userMealsWithTodayDate: Meals[],
  ) {
    const totalNeeds = {
      proteins: dailyNeed.proteins,
      lipids: dailyNeed.lipids,
      carbohydrates: dailyNeed.carbohydrates,
    };

    const totalCarbohydrates = 0;
    const totalProteins = 0;
    const totalLipids = 0;

    // for (const meal of userMealsWithTodayDate) {
    //   for (const product of meal.products) {
    //     totalCarbohydrates += product.carbohydrates;
    //     totalProteins += product.proteins;
    //     totalLipids += product.lipids;
    //   }
    // }
    const needsLeft = {
      protein: totalNeeds.proteins - totalProteins,
      lipid: totalNeeds.lipids - totalLipids,
      carb: totalNeeds.carbohydrates - totalCarbohydrates,
    };
    return needsLeft;
  }
}

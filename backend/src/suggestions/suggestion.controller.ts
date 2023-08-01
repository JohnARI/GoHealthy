import { Body, Controller, Post, UseGuards, Request } from '@nestjs/common';
import { SuggestionService } from './suggestion.service';
import { BodyBuildService } from 'src/body-build/body-build.service';
import { JwtAccessGuard } from 'src/auth/guards/jwt-access.guard';
import { RequestWithUserUniqueInput } from 'src/types/request.type';

@Controller('suggestion')
export class SuggestionController {
  constructor(
    private readonly suggestionService: SuggestionService,
    private readonly bodyBuildService: BodyBuildService,
  ) {}

  @UseGuards(JwtAccessGuard)
  @Post('searchbreakfast')
  async searchBreakfast(
    @Request() req: RequestWithUserUniqueInput,
    @Body() body,
  ) {
    const dailyNeed = await this.suggestionService.findUserDailyNeed(
      req.user.id,
    );
    const userMealsWithTodayDate =
      await this.suggestionService.findUserDailyMealHistory(req.user.id);

    const needsLeft = await this.suggestionService.calculateTotalNeeds(
      dailyNeed,
      userMealsWithTodayDate,
    );

    return this.suggestionService.suggestBreakfast(
      {
        protein: needsLeft.protein / 3,
        lipid: needsLeft.lipid / 3,
        carb: needsLeft.carb / 3,
      },
      body,
    );
  }

  @UseGuards(JwtAccessGuard)
  @Post('searchlunch')
  async searchLunch(@Request() req: RequestWithUserUniqueInput, @Body() body) {
    const dailyNeed = await this.suggestionService.findUserDailyNeed(
      req.user.id,
    );
    const userMealsWithTodayDate =
      await this.suggestionService.findUserDailyMealHistory(req.user.id);

    const needsLeft = await this.suggestionService.calculateTotalNeeds(
      dailyNeed,
      userMealsWithTodayDate,
    );

    return this.suggestionService.suggestLunch(
      {
        protein: needsLeft.protein / 2,
        lipid: needsLeft.lipid / 2,
        carb: needsLeft.carb / 2,
      },
      body,
    );
  }

  @UseGuards(JwtAccessGuard)
  @Post('searchdinner')
  async searchDinner(@Request() req: RequestWithUserUniqueInput, @Body() body) {
    const dailyNeed = await this.suggestionService.findUserDailyNeed(
      req.user.id,
    );

    const userMealsWithTodayDate =
      await this.suggestionService.findUserDailyMealHistory(req.user.id);

    const needsLeft = this.suggestionService.calculateTotalNeeds(
      dailyNeed,
      userMealsWithTodayDate,
    );

    return this.suggestionService.suggestDinner(needsLeft, body);
  }
}

/*
  Warnings:

  - You are about to drop the `_MealHistoryToMeals` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `mealId` to the `MealHistory` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_MealHistoryToMeals" DROP CONSTRAINT "_MealHistoryToMeals_A_fkey";

-- DropForeignKey
ALTER TABLE "_MealHistoryToMeals" DROP CONSTRAINT "_MealHistoryToMeals_B_fkey";

-- AlterTable
ALTER TABLE "MealHistory" ADD COLUMN     "mealId" TEXT NOT NULL;

-- DropTable
DROP TABLE "_MealHistoryToMeals";

-- AddForeignKey
ALTER TABLE "MealHistory" ADD CONSTRAINT "MealHistory_mealId_fkey" FOREIGN KEY ("mealId") REFERENCES "Meals"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

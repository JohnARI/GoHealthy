/*
  Warnings:

  - You are about to drop the column `mealId` on the `MealHistory` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "MealHistory" DROP CONSTRAINT "MealHistory_mealId_fkey";

-- AlterTable
ALTER TABLE "MealHistory" DROP COLUMN "mealId";

-- CreateTable
CREATE TABLE "_MealHistoryToMeals" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MealHistoryToMeals_AB_unique" ON "_MealHistoryToMeals"("A", "B");

-- CreateIndex
CREATE INDEX "_MealHistoryToMeals_B_index" ON "_MealHistoryToMeals"("B");

-- AddForeignKey
ALTER TABLE "_MealHistoryToMeals" ADD CONSTRAINT "_MealHistoryToMeals_A_fkey" FOREIGN KEY ("A") REFERENCES "MealHistory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MealHistoryToMeals" ADD CONSTRAINT "_MealHistoryToMeals_B_fkey" FOREIGN KEY ("B") REFERENCES "Meals"("id") ON DELETE CASCADE ON UPDATE CASCADE;

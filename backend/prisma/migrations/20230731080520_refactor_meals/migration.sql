/*
  Warnings:

  - You are about to drop the `MealsOnProducts` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "MealsOnProducts" DROP CONSTRAINT "MealsOnProducts_mealHistoryId_fkey";

-- DropForeignKey
ALTER TABLE "MealsOnProducts" DROP CONSTRAINT "MealsOnProducts_mealId_fkey";

-- DropForeignKey
ALTER TABLE "MealsOnProducts" DROP CONSTRAINT "MealsOnProducts_productId_fkey";

-- AlterTable
ALTER TABLE "Meal" ADD COLUMN     "mealHistoryId" TEXT;

-- DropTable
DROP TABLE "MealsOnProducts";

-- CreateTable
CREATE TABLE "_MealToProduct" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MealToProduct_AB_unique" ON "_MealToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_MealToProduct_B_index" ON "_MealToProduct"("B");

-- AddForeignKey
ALTER TABLE "Meal" ADD CONSTRAINT "Meal_mealHistoryId_fkey" FOREIGN KEY ("mealHistoryId") REFERENCES "MealHistory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MealToProduct" ADD CONSTRAINT "_MealToProduct_A_fkey" FOREIGN KEY ("A") REFERENCES "Meal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MealToProduct" ADD CONSTRAINT "_MealToProduct_B_fkey" FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

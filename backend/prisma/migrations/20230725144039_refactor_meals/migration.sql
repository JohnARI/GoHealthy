/*
  Warnings:

  - You are about to drop the column `mass` on the `Meal` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `MealsOnProducts` table. All the data in the column will be lost.
  - You are about to drop the column `mass` on the `MealsOnProducts` table. All the data in the column will be lost.
  - You are about to drop the column `mealType` on the `MealsOnProducts` table. All the data in the column will be lost.
  - You are about to drop the column `mass` on the `Product` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Meal" DROP COLUMN "mass",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "massInGrams" DOUBLE PRECISION NOT NULL DEFAULT 0,
ADD COLUMN     "mealType" "MealType" NOT NULL DEFAULT 'SNACK';

-- AlterTable
ALTER TABLE "MealsOnProducts" DROP COLUMN "createdAt",
DROP COLUMN "mass",
DROP COLUMN "mealType";

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "mass",
ADD COLUMN     "massInGrams" DOUBLE PRECISION NOT NULL DEFAULT 0;

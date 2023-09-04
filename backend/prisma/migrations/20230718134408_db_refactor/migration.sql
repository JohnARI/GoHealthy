/*/*
  Warnings:

  - You are about to drop the column `date` on the `MealHistory` table. All the data in the column will be lost.
  - You are about to drop the column `mealId` on the `MealHistory` table. All the data in the column will be lost.
  - You are about to drop the `MealOnProduct` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Meals` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `MealHistory` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateEnum
CREATE TYPE "DietIntensity" AS ENUM ('LOW', 'MEDIUM', 'HIGH');

-- CreateEnum
CREATE TYPE "Diet" AS ENUM ('LOWCARB', 'LOWFAT', 'STANDARD', 'HIGHPROTEIN');

-- DropForeignKey
ALTER TABLE "MealHistory" DROP CONSTRAINT "MealHistory_mealId_fkey";

-- DropForeignKey
ALTER TABLE "MealOnProduct" DROP CONSTRAINT "MealOnProduct_mealId_fkey";

-- DropForeignKey
ALTER TABLE "MealOnProduct" DROP CONSTRAINT "MealOnProduct_productId_fkey";

-- DropForeignKey
ALTER TABLE "MealOnProduct" DROP CONSTRAINT "MealOnProduct_userId_fkey";

-- DropIndex
DROP INDEX "Product_EAN_key";

-- AlterTable
ALTER TABLE "BodyBuild" ADD COLUMN     "diet" "Diet" NOT NULL DEFAULT 'STANDARD',
ADD COLUMN     "dietIntensity" "DietIntensity" NOT NULL DEFAULT 'MEDIUM';

-- AlterTable
ALTER TABLE "MealHistory" DROP COLUMN "date",
DROP COLUMN "mealId";

-- DropTable
DROP TABLE "MealOnProduct";

-- DropTable
DROP TABLE "Meals";
*/
-- CreateTable
CREATE TABLE "MealsOnProducts" (
    "productId" TEXT NOT NULL,
    "mealId" TEXT NOT NULL,
    "mealHistoryId" TEXT,
    "mass" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "mealType" "MealType" NOT NULL DEFAULT 'SNACK',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Meal" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "imageBucketId" TEXT NOT NULL DEFAULT '',
    "mass" DOUBLE PRECISION NOT NULL DEFAULT 0,

    CONSTRAINT "Meal_pkey" PRIMARY KEY ("id")
);

/*

-- CreateTable
CREATE TABLE "BodyNeeds" (
    "id" TEXT NOT NULL,
    "bodyBuildId" TEXT NOT NULL,
    "calories" INTEGER NOT NULL,
    "proteins" INTEGER NOT NULL,
    "carbohydrates" INTEGER NOT NULL,
    "lipids" INTEGER NOT NULL

    CONSTRAINT "BodyNeeds_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "MealsOnProducts_productId_key" ON "MealsOnProducts"("productId");

-- CreateIndex
CREATE UNIQUE INDEX "MealsOnProducts_mealId_key" ON "MealsOnProducts"("mealId");

-- CreateIndex
-- CREATE UNIQUE INDEX "BodyNeeds_bodyBuildId_key" ON "BodyNeeds"("bodyBuildId");

-- CreateIndex
CREATE UNIQUE INDEX "MealHistory_userId_key" ON "MealHistory"("userId");
*/
-- AddForeignKey
ALTER TABLE "MealsOnProducts" ADD CONSTRAINT "MealsOnProducts_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealsOnProducts" ADD CONSTRAINT "MealsOnProducts_mealId_fkey" FOREIGN KEY ("mealId") REFERENCES "Meal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealsOnProducts" ADD CONSTRAINT "MealsOnProducts_mealHistoryId_fkey" FOREIGN KEY ("mealHistoryId") REFERENCES "MealHistory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

/*
-- AddForeignKey
-- ALTER TABLE "BodyNeeds" ADD CONSTRAINT "BodyNeeds_bodyBuildId_fkey" FOREIGN KEY ("bodyBuildId") REFERENCES "BodyBuild"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
*/
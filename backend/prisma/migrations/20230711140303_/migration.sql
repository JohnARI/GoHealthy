/*
  Warnings:

  - Added the required column `mealType` to the `Meals` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "MealType" AS ENUM ('BREAKFAST', 'LUNCH', 'DINNER', 'SNACK');

-- AlterTable
ALTER TABLE "Meals" ADD COLUMN     "mealType" "MealType" NOT NULL;

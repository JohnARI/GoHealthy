/*
  Warnings:

  - Added the required column `weightInGrams` to the `MealOnProduct` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "MealOnProduct" ADD COLUMN     "weightInGrams" DOUBLE PRECISION NOT NULL;

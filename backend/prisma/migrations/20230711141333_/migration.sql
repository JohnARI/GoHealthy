/*
  Warnings:

  - You are about to drop the column `weightInGrams` on the `MealOnProduct` table. All the data in the column will be lost.
  - Added the required column `weightInGrams` to the `Meals` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "MealOnProduct" DROP COLUMN "weightInGrams";

-- AlterTable
ALTER TABLE "Meals" ADD COLUMN     "weightInGrams" DOUBLE PRECISION NOT NULL;

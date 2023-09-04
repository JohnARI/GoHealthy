/*
  Warnings:

  - The values [SLOW,FAST] on the enum `DietIntensity` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `date` on the `MealHistory` table. All the data in the column will be lost.
  - You are about to drop the column `mealId` on the `MealHistory` table. All the data in the column will be lost.
  - You are about to drop the `MealOnProduct` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Meals` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `MealHistory` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "DietIntensity_new" AS ENUM ('LOW', 'MEDIUM', 'HIGH');
ALTER TABLE "BodyBuild" ALTER COLUMN "dietIntensity" TYPE "DietIntensity_new" USING ("dietIntensity"::text::"DietIntensity_new");
ALTER TYPE "DietIntensity" RENAME TO "DietIntensity_old";
ALTER TYPE "DietIntensity_new" RENAME TO "DietIntensity";
DROP TYPE "DietIntensity_old";
COMMIT;

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
ALTER TABLE "BodyBuild" ALTER COLUMN "diet" SET DEFAULT 'STANDARD',
ALTER COLUMN "dietIntensity" SET DEFAULT 'MEDIUM';

-- AlterTable
ALTER TABLE "MealHistory" DROP COLUMN "date",
DROP COLUMN "mealId";

-- DropTable
DROP TABLE "MealOnProduct";

-- DropTable
DROP TABLE "Meals";

-- CreateIndex
CREATE UNIQUE INDEX "MealHistory_userId_key" ON "MealHistory"("userId");

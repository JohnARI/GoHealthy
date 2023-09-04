/*
  Warnings:

  - A unique constraint covering the columns `[userId]` on the table `BodyBuild` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[bodyId]` on the table `BodyNeeds` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `diet` to the `BodyBuild` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dietIntensity` to the `BodyBuild` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Diet" AS ENUM ('LOWCARB', 'LOWFAT', 'HIGHPROTEIN', 'STANDARD');

-- CreateEnum
CREATE TYPE "DietIntensity" AS ENUM ('SLOW', 'MEDIUM', 'FAST');

-- AlterTable
ALTER TABLE "BodyBuild" ADD COLUMN     "diet" "Diet" NOT NULL,
ADD COLUMN     "dietIntensity" "DietIntensity" NOT NULL;

-- CreateIndex
-- CREATE UNIQUE INDEX "BodyBuild_userId_key" ON "BodyBuild"("userId");
-- CreateIndex
-- CREATE UNIQUE INDEX "BodyNeeds_bodyId_key" ON "BodyNeeds"("bodyId");

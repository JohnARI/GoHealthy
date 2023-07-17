/*
  Warnings:

  - Added the required column `eatenAt` to the `Meals` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Meals" ADD COLUMN     "eatenAt" TIMESTAMP(3) NOT NULL;

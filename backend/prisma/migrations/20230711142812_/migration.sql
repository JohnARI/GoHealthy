/*
  Warnings:

  - You are about to drop the column `eatenAt` on the `Meals` table. All the data in the column will be lost.
  - You are about to drop the column `weightInGrams` on the `Meals` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Meals" DROP COLUMN "eatenAt",
DROP COLUMN "weightInGrams";

-- CreateTable
CREATE TABLE "MealHistory" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "mealId" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MealHistory_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MealHistory" ADD CONSTRAINT "MealHistory_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealHistory" ADD CONSTRAINT "MealHistory_mealId_fkey" FOREIGN KEY ("mealId") REFERENCES "Meals"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

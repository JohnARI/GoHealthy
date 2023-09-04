/*
  Warnings:

  - You are about to drop the `_MealToProduct` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_MealToProduct" DROP CONSTRAINT "_MealToProduct_A_fkey";

-- DropForeignKey
ALTER TABLE "_MealToProduct" DROP CONSTRAINT "_MealToProduct_B_fkey";

-- DropTable
DROP TABLE "_MealToProduct";

-- CreateTable
CREATE TABLE "MealOnProduct" (
    "id" TEXT NOT NULL,
    "mealId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "weightInGrams" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "MealOnProduct_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MealOnProduct" ADD CONSTRAINT "MealOnProduct_mealId_fkey" FOREIGN KEY ("mealId") REFERENCES "Meals"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealOnProduct" ADD CONSTRAINT "MealOnProduct_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

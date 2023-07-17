/*
  Warnings:

  - You are about to drop the column `productEAN` on the `Meals` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[EAN]` on the table `Products` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `EAN` to the `Products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Meals" DROP COLUMN "productEAN";

-- AlterTable
ALTER TABLE "Products" ADD COLUMN     "EAN" DOUBLE PRECISION NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Products_EAN_key" ON "Products"("EAN");

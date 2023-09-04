/*
  Warnings:

  - A unique constraint covering the columns `[EAN]` on the table `Products` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Products" ALTER COLUMN "EAN" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Products_EAN_key" ON "Products"("EAN");

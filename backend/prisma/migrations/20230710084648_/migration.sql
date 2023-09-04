-- AlterTable
ALTER TABLE "MealOnProduct" ADD COLUMN "userId" TEXT NOT NULL DEFAULT '';

-- AlterTable
ALTER TABLE "Products" ADD COLUMN "userId" TEXT NOT NULL DEFAULT '';

-- AddForeignKey
ALTER TABLE "Products" ADD CONSTRAINT "Products_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealOnProduct" ADD CONSTRAINT "MealOnProduct_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

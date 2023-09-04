-- CreateTable
CREATE TABLE "_MealToProduct" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MealToProduct_AB_unique" ON "_MealToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_MealToProduct_B_index" ON "_MealToProduct"("B");

-- AddForeignKey
ALTER TABLE "_MealToProduct" ADD CONSTRAINT "_MealToProduct_A_fkey" FOREIGN KEY ("A") REFERENCES "Meals"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MealToProduct" ADD CONSTRAINT "_MealToProduct_B_fkey" FOREIGN KEY ("B") REFERENCES "Products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

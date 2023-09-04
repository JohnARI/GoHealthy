-- CreateTable
CREATE TABLE "BodyNeeds" (
    "id" TEXT NOT NULL,
    "bodyId" TEXT NOT NULL,
    "calories" INTEGER NOT NULL,
    "proteins" INTEGER NOT NULL,
    "carbohydrates" INTEGER NOT NULL,
    "lipids" INTEGER NOT NULL,

    CONSTRAINT "BodyNeeds_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "BodyNeeds" ADD CONSTRAINT "BodyNeeds_bodyId_fkey" FOREIGN KEY ("bodyId") REFERENCES "BodyBuild"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

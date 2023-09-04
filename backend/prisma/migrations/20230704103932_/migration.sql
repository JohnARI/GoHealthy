-- CreateTable
CREATE TABLE "Meals" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "imageBucketId" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Meals_pkey" PRIMARY KEY ("id")
);

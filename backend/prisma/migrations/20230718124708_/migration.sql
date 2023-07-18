/*
  Warnings:

  - You are about to drop the `codeResetPassword` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "codeResetPassword" DROP CONSTRAINT "codeResetPassword_userId_fkey";

-- DropTable
DROP TABLE "codeResetPassword";

-- CreateTable
CREATE TABLE "CodeResetPassword" (
    "id" TEXT NOT NULL,
    "code" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "expirationDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CodeResetPassword_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "CodeResetPassword_code_key" ON "CodeResetPassword"("code");

-- CreateIndex
CREATE UNIQUE INDEX "CodeResetPassword_userId_key" ON "CodeResetPassword"("userId");

-- AddForeignKey
ALTER TABLE "CodeResetPassword" ADD CONSTRAINT "CodeResetPassword_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

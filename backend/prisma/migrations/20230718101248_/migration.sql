/*
  Warnings:

  - You are about to drop the column `email` on the `codeResetPassword` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userId]` on the table `codeResetPassword` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `codeResetPassword` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "codeResetPassword" DROP CONSTRAINT "codeResetPassword_email_fkey";

-- DropIndex
DROP INDEX "codeResetPassword_email_key";

-- AlterTable
ALTER TABLE "codeResetPassword" DROP COLUMN "email",
ADD COLUMN     "userId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "codeResetPassword_userId_key" ON "codeResetPassword"("userId");

-- AddForeignKey
ALTER TABLE "codeResetPassword" ADD CONSTRAINT "codeResetPassword_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

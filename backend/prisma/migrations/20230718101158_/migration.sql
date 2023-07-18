/*
  Warnings:

  - You are about to drop the column `userId` on the `codeResetPassword` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `codeResetPassword` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `email` to the `codeResetPassword` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "codeResetPassword" DROP CONSTRAINT "codeResetPassword_userId_fkey";

-- DropIndex
DROP INDEX "codeResetPassword_userId_key";

-- AlterTable
ALTER TABLE "codeResetPassword" DROP COLUMN "userId",
ADD COLUMN     "email" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "codeResetPassword_email_key" ON "codeResetPassword"("email");

-- AddForeignKey
ALTER TABLE "codeResetPassword" ADD CONSTRAINT "codeResetPassword_email_fkey" FOREIGN KEY ("email") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

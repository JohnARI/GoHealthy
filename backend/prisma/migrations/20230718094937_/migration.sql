-- CreateTable
CREATE TABLE "codeResetPassword" (
    "id" TEXT NOT NULL,
    "code" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "codeResetPassword_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "codeResetPassword_code_key" ON "codeResetPassword"("code");

-- CreateIndex
CREATE UNIQUE INDEX "codeResetPassword_userId_key" ON "codeResetPassword"("userId");

-- AddForeignKey
ALTER TABLE "codeResetPassword" ADD CONSTRAINT "codeResetPassword_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

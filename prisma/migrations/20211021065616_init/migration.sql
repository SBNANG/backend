/*
  Warnings:

  - You are about to alter the column `booking_end` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `booking_start` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.

*/
-- AlterTable
ALTER TABLE `booking` MODIFY `booking_end` DATETIME NOT NULL,
    MODIFY `booking_start` DATETIME NOT NULL;

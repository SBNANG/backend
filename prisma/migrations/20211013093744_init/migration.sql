/*
  Warnings:

  - You are about to alter the column `booking_datetime` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `check_in_datetime` on the `check_in` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `check_out_datetime` on the `check_out` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `payment_datetime` on the `payment` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.

*/
-- AlterTable
ALTER TABLE `booking` MODIFY `booking_datetime` DATETIME NOT NULL;

-- AlterTable
ALTER TABLE `check_in` MODIFY `check_in_datetime` DATETIME NOT NULL;

-- AlterTable
ALTER TABLE `check_out` MODIFY `check_out_datetime` DATETIME NOT NULL;

-- AlterTable
ALTER TABLE `payment` MODIFY `payment_datetime` DATETIME NOT NULL;

/*
  Warnings:

  - You are about to alter the column `booking_end` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `booking_start` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to drop the column `authorities_id` on the `check_in` table. All the data in the column will be lost.
  - You are about to drop the column `customer_id` on the `check_in` table. All the data in the column will be lost.
  - You are about to drop the column `authorities_id` on the `check_out` table. All the data in the column will be lost.
  - You are about to drop the column `customer_id` on the `check_out` table. All the data in the column will be lost.
  - Added the required column `booking_id` to the `Check_in` table without a default value. This is not possible if the table is not empty.
  - Added the required column `booking_id` to the `Check_out` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `check_in` DROP FOREIGN KEY `Check_in_authorities_id_fkey`;

-- DropForeignKey
ALTER TABLE `check_in` DROP FOREIGN KEY `Check_in_customer_id_fkey`;

-- DropForeignKey
ALTER TABLE `check_out` DROP FOREIGN KEY `Check_out_authorities_id_fkey`;

-- DropForeignKey
ALTER TABLE `check_out` DROP FOREIGN KEY `Check_out_customer_id_fkey`;

-- AlterTable
ALTER TABLE `booking` MODIFY `booking_end` DATETIME NOT NULL,
    MODIFY `booking_start` DATETIME NOT NULL;

-- AlterTable
ALTER TABLE `check_in` DROP COLUMN `authorities_id`,
    DROP COLUMN `customer_id`,
    ADD COLUMN `booking_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `check_out` DROP COLUMN `authorities_id`,
    DROP COLUMN `customer_id`,
    ADD COLUMN `booking_id` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Check_in` ADD CONSTRAINT `Check_in_booking_id_fkey` FOREIGN KEY (`booking_id`) REFERENCES `Booking`(`booking_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Check_out` ADD CONSTRAINT `Check_out_booking_id_fkey` FOREIGN KEY (`booking_id`) REFERENCES `Booking`(`booking_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

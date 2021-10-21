/*
  Warnings:

  - You are about to alter the column `booking_end` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `booking_start` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to drop the column `booking_id` on the `check_out` table. All the data in the column will be lost.
  - Added the required column `check_in_id` to the `Check_out` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `check_out` DROP FOREIGN KEY `Check_out_booking_id_fkey`;

-- AlterTable
ALTER TABLE `booking` MODIFY `booking_end` DATETIME NOT NULL,
    MODIFY `booking_start` DATETIME NOT NULL;

-- AlterTable
ALTER TABLE `check_out` DROP COLUMN `booking_id`,
    ADD COLUMN `check_in_id` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Check_out` ADD CONSTRAINT `Check_out_check_in_id_fkey` FOREIGN KEY (`check_in_id`) REFERENCES `Check_in`(`check_in_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

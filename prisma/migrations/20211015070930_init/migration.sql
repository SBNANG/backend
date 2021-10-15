/*
  Warnings:

  - You are about to drop the column `booking_datetime` on the `booking` table. All the data in the column will be lost.
  - You are about to drop the column `check_in_datetime` on the `check_in` table. All the data in the column will be lost.
  - You are about to drop the column `check_out_datetime` on the `check_out` table. All the data in the column will be lost.
  - You are about to drop the column `payment_datetime` on the `payment` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `booking_status` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payment_image` to the `payment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `room_number` to the `room` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `user_type` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `booking` DROP COLUMN `booking_datetime`;

-- AlterTable
ALTER TABLE `booking_status` ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `check_in` DROP COLUMN `check_in_datetime`;

-- AlterTable
ALTER TABLE `check_out` DROP COLUMN `check_out_datetime`;

-- AlterTable
ALTER TABLE `payment` DROP COLUMN `payment_datetime`,
    ADD COLUMN `payment_image` TEXT NOT NULL;

-- AlterTable
ALTER TABLE `room` ADD COLUMN `room_number` VARCHAR(5) NOT NULL;

-- AlterTable
ALTER TABLE `user_type` ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL;

/*
  Warnings:

  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_type` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `booking_end` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `booking_start` to the `Booking` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `booking_authorities_id_fkey`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `booking_booking_status_id_fkey`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `booking_customer_id_fkey`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `booking_payment_id_fkey`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `booking_room_id_fkey`;

-- DropForeignKey
ALTER TABLE `check_in` DROP FOREIGN KEY `check_in_authorities_id_fkey`;

-- DropForeignKey
ALTER TABLE `check_in` DROP FOREIGN KEY `check_in_customer_id_fkey`;

-- DropForeignKey
ALTER TABLE `check_out` DROP FOREIGN KEY `check_out_authorities_id_fkey`;

-- DropForeignKey
ALTER TABLE `check_out` DROP FOREIGN KEY `check_out_customer_id_fkey`;

-- DropForeignKey
ALTER TABLE `payment` DROP FOREIGN KEY `payment_authorities_id_fkey`;

-- DropForeignKey
ALTER TABLE `payment` DROP FOREIGN KEY `payment_customer_id_fkey`;

-- DropForeignKey
ALTER TABLE `room` DROP FOREIGN KEY `room_room_type_id_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_user_type_id_fkey`;

-- AlterTable
ALTER TABLE `booking` ADD COLUMN `booking_end` DATETIME NOT NULL,
    ADD COLUMN `booking_start` DATETIME NOT NULL;

-- DropTable
DROP TABLE `user`;

-- DropTable
DROP TABLE `user_type`;

-- CreateTable
CREATE TABLE `Customer` (
    `customer_id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer_prefix` VARCHAR(10) NOT NULL,
    `customer_name` VARCHAR(10) NOT NULL,
    `customer_surname` VARCHAR(10) NOT NULL,
    `customer_email` VARCHAR(30) NOT NULL,
    `customer_password` TEXT NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`customer_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Authorities` (
    `authorities_id` INTEGER NOT NULL AUTO_INCREMENT,
    `authorities_prefix` VARCHAR(10) NOT NULL,
    `authorities_name` VARCHAR(10) NOT NULL,
    `authorities_surname` VARCHAR(10) NOT NULL,
    `authorities_email` VARCHAR(30) NOT NULL,
    `authorities_password` TEXT NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`authorities_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Room` ADD CONSTRAINT `Room_room_type_id_fkey` FOREIGN KEY (`room_type_id`) REFERENCES `Room_type`(`room_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Payment` ADD CONSTRAINT `Payment_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Payment` ADD CONSTRAINT `Payment_authorities_id_fkey` FOREIGN KEY (`authorities_id`) REFERENCES `Authorities`(`authorities_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Booking` ADD CONSTRAINT `Booking_booking_status_id_fkey` FOREIGN KEY (`booking_status_id`) REFERENCES `Booking_status`(`booking_status_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Booking` ADD CONSTRAINT `Booking_room_id_fkey` FOREIGN KEY (`room_id`) REFERENCES `Room`(`room_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Booking` ADD CONSTRAINT `Booking_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Booking` ADD CONSTRAINT `Booking_authorities_id_fkey` FOREIGN KEY (`authorities_id`) REFERENCES `Authorities`(`authorities_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Booking` ADD CONSTRAINT `Booking_payment_id_fkey` FOREIGN KEY (`payment_id`) REFERENCES `Payment`(`payment_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Check_in` ADD CONSTRAINT `Check_in_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Check_in` ADD CONSTRAINT `Check_in_authorities_id_fkey` FOREIGN KEY (`authorities_id`) REFERENCES `Authorities`(`authorities_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Check_out` ADD CONSTRAINT `Check_out_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Check_out` ADD CONSTRAINT `Check_out_authorities_id_fkey` FOREIGN KEY (`authorities_id`) REFERENCES `Authorities`(`authorities_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

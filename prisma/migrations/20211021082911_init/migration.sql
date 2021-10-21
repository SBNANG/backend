/*
  Warnings:

  - You are about to alter the column `booking_end` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `booking_start` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.

*/
-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `Booking_authorities_id_fkey`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `Booking_booking_status_id_fkey`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `Booking_customer_id_fkey`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `Booking_payment_id_fkey`;

-- DropForeignKey
ALTER TABLE `booking` DROP FOREIGN KEY `Booking_room_id_fkey`;

-- DropForeignKey
ALTER TABLE `check_in` DROP FOREIGN KEY `Check_in_booking_id_fkey`;

-- DropForeignKey
ALTER TABLE `check_out` DROP FOREIGN KEY `Check_out_check_in_id_fkey`;

-- DropForeignKey
ALTER TABLE `payment` DROP FOREIGN KEY `Payment_authorities_id_fkey`;

-- DropForeignKey
ALTER TABLE `payment` DROP FOREIGN KEY `Payment_customer_id_fkey`;

-- DropForeignKey
ALTER TABLE `room` DROP FOREIGN KEY `Room_room_type_id_fkey`;

-- AlterTable
ALTER TABLE `booking` MODIFY `booking_end` DATETIME NOT NULL,
    MODIFY `booking_start` DATETIME NOT NULL;

-- AddForeignKey
ALTER TABLE `room` ADD CONSTRAINT `room_room_type_id_fkey` FOREIGN KEY (`room_type_id`) REFERENCES `room_type`(`room_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_authorities_id_fkey` FOREIGN KEY (`authorities_id`) REFERENCES `authorities`(`authorities_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `booking` ADD CONSTRAINT `booking_booking_status_id_fkey` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status`(`booking_status_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `booking` ADD CONSTRAINT `booking_room_id_fkey` FOREIGN KEY (`room_id`) REFERENCES `room`(`room_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `booking` ADD CONSTRAINT `booking_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `booking` ADD CONSTRAINT `booking_authorities_id_fkey` FOREIGN KEY (`authorities_id`) REFERENCES `authorities`(`authorities_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `booking` ADD CONSTRAINT `booking_payment_id_fkey` FOREIGN KEY (`payment_id`) REFERENCES `payment`(`payment_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `check_in` ADD CONSTRAINT `check_in_booking_id_fkey` FOREIGN KEY (`booking_id`) REFERENCES `booking`(`booking_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `check_out` ADD CONSTRAINT `check_out_check_in_id_fkey` FOREIGN KEY (`check_in_id`) REFERENCES `check_in`(`check_in_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

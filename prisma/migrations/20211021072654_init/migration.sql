/*
  Warnings:

  - You are about to alter the column `booking_end` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `booking_start` on the `booking` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to drop the column `room_bed_size` on the `room` table. All the data in the column will be lost.
  - Added the required column `room_type_bed` to the `Room_type` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `booking` MODIFY `booking_end` DATETIME NOT NULL,
    MODIFY `booking_start` DATETIME NOT NULL;

-- AlterTable
ALTER TABLE `room` DROP COLUMN `room_bed_size`;

-- AlterTable
ALTER TABLE `room_type` ADD COLUMN `room_type_bed` VARCHAR(10) NOT NULL;

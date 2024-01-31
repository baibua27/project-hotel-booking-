-- CreateTable
CREATE TABLE `Customer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER',
    `name` VARCHAR(191) NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NULL,

    UNIQUE INDEX `Customer_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Room` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER',
    `roomname` VARCHAR(191) NULL,
    `type` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `price` VARCHAR(191) NOT NULL,
    `customer_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reservation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER',
    `amount` INTEGER NOT NULL,
    `room_id` VARCHAR(191) NOT NULL,
    `checklnDate` DATETIME(3) NOT NULL,
    `CheckOutDate` DATETIME(3) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `customer_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Payment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER',
    `amount` INTEGER NOT NULL,
    `paymentData` DATETIME(3) NOT NULL,
    `paymentMethod` VARCHAR(191) NOT NULL,
    `reservation_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Room` ADD CONSTRAINT `Room_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Payment` ADD CONSTRAINT `Payment_reservation_id_fkey` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

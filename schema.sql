CREATE TABLE "Riders" (
	"rider_id" INTEGER UNIQUE,
	"email" VARCHAR(255),
	"phone" VARCHAR(255),
	"name" VARCHAR(255),
	"age" INTEGER,
	"profile_image_url" VARCHAR(255),
	"is_active" VARCHAR(255),
	"created_at" TIMESTAMP,
	PRIMARY KEY("rider_id")
);

CREATE TABLE "Rides" (
	"ride_id" INTEGER NOT NULL UNIQUE,
	"rider_id" VARCHAR(255),
	"driver_id" INTEGER,
	"vehicle_id" INTEGER,
	"pickup_latitude" DECIMAL,
	"pickup_longitude" DECIMAL,
	"pickup_adress" VARCHAR(255),
	"destination_latitude" DECIMAL,
	"decimal_longitude" DECIMAL,
	"destination_address" VARCHAR(255),
	"Fare" INTEGER,
	"requested_vehicle_type" VARCHAR(255),
	"status" VARCHAR(255),
	"ride_duration" REAL,
	"distance" DECIMAL,
	PRIMARY KEY("ride_id")
);

CREATE TABLE "Drivers" (
	"driver_id" INTEGER NOT NULL UNIQUE,
	"email" VARCHAR(255),
	"Phone_no" VARCHAR(255),
	"Licence" VARCHAR(255),
	"driver_name" VARCHAR(255),
	"profile_image_url" VARCHAR(255),
	"Rating" VARCHAR(255),
	"Total_Rides" INTEGER,
	"Driver_status" BOOLEAN,
	"is_online" BOOLEAN,
	"created_at" TIMESTAMP,
	PRIMARY KEY("driver_id")
);

CREATE TABLE "Vehicles" (
	"vehicle_id" INTEGER NOT NULL UNIQUE,
	"driver_id" INTEGER,
	"licine_plate" VARCHAR(255),
	"Vehicle_Comapny" VARCHAR(255),
	"Model" VARCHAR(255),
	"Vehicle_Type" VARCHAR(255),
	"Seats" INTEGER,
	"is_active" VARCHAR(255),
	PRIMARY KEY("vehicle_id")
);

CREATE TABLE "Driver_location" (
	"location_id" INTEGER NOT NULL UNIQUE,
	"driver_id" INTEGER,
	"latitude" DECIMAL,
	"longitude" VARCHAR(255),
	"heading" VARCHAR(255),
	"speed" DECIMAL,
	"accuracy_meters" DECIMAL,
	"Updated_at" TIMESTAMP,
	PRIMARY KEY("location_id")
);

CREATE TABLE "Pricing_Zone" (
	"Zone_id" INTEGER NOT NULL UNIQUE,
	"Zone_Name" VARCHAR(255),
	"boundary_polygone" INTEGER,
	"base_rate_perkm" DECIMAL,
	"base_rate_per_min" DECIMAL,
	"minimum_fare" DECIMAL,
	"is_active" BOOLEAN,
	PRIMARY KEY("Zone_id")
);

CREATE TABLE "Surge_pricing" (
	"Surge_id" INTEGER NOT NULL UNIQUE,
	"zone_id" INTEGER,
	"multiplyer" DECIMAL,
	"start_time" TIMESTAMP,
	"end_time" TIMESTAMP,
	PRIMARY KEY("Surge_id")
);

CREATE TABLE "Payments" (
	"Payment_id" INTEGER NOT NULL UNIQUE,
	"ride_id" INTEGER,
	"amount" DECIMAL NOT NULL,
	"payment_meyhod" VARCHAR(255),
	"Payment_status" VARCHAR(255),
	"gateway_transiction_id" VARCHAR(255),
	"failure_reason" VARCHAR(255),
	"processed_at" VARCHAR(255) NOT NULL,
	"created_at" TIMESTAMP,
	PRIMARY KEY("Payment_id")
);

CREATE TABLE "Rating" (
	"rating_id" INTEGER NOT NULL UNIQUE,
	"rider_id" INTEGER,
	"rater_type" VARCHAR(255),
	"rater_id" VARCHAR(255),
	"rater_type" INTEGER,
	"starts" INTEGER,
	"comment" VARCHAR(255),
	"created_at" TIMESTAMP,
	PRIMARY KEY("rating_id")
);

ALTER TABLE "Rides"
ADD FOREIGN KEY("rider_id") REFERENCES "Riders"("rider_id")
ON UPDATE NO ACTION ON DELETE SET NULL;

ALTER TABLE "Rides"
ADD FOREIGN KEY("driver_id") REFERENCES "Drivers"("driver_id")
ON UPDATE NO ACTION ON DELETE SET NULL;

ALTER TABLE "Rides"
ADD FOREIGN KEY("vehicle_id") REFERENCES "Vehicles"("vehicle_id")
ON UPDATE NO ACTION ON DELETE SET NULL;

ALTER TABLE "Vehicles"
ADD FOREIGN KEY("driver_id") REFERENCES "Drivers"("driver_id")
ON UPDATE NO ACTION ON DELETE SET NULL;

ALTER TABLE "Driver_location"
ADD FOREIGN KEY("driver_id") REFERENCES "Drivers"("driver_id")
ON UPDATE NO ACTION ON DELETE SET NULL;

ALTER TABLE "Surge_pricing"
ADD FOREIGN KEY("zone_id") REFERENCES "Pricing_Zone"("Zone_id")
ON UPDATE NO ACTION ON DELETE SET NULL;

ALTER TABLE "Payments"
ADD FOREIGN KEY("ride_id") REFERENCES "Rides"("ride_id")
ON UPDATE NO ACTION ON DELETE SET NULL;

ALTER TABLE "Rating"
ADD FOREIGN KEY("rider_id") REFERENCES "Rides"("rider_id")
ON UPDATE NO ACTION ON DELETE SET NULL;

-- Indexes on foreign key columns
CREATE INDEX "idx_rides_rider_id" ON "Rides"("rider_id");
CREATE INDEX "idx_rides_driver_id" ON "Rides"("driver_id");
CREATE INDEX "idx_rides_vehicle_id" ON "Rides"("vehicle_id");
CREATE INDEX "idx_vehicles_driver_id" ON "Vehicles"("driver_id");
CREATE INDEX "idx_driver_location_driver_id" ON "Driver_location"("driver_id");
CREATE INDEX "idx_surge_pricing_zone_id" ON "Surge_pricing"("zone_id");
CREATE INDEX "idx_payments_ride_id" ON "Payments"("ride_id");
CREATE INDEX "idx_rating_rider_id" ON "Rating"("rider_id");
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2023 at 10:30 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jisspetcedoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add doctor', 1, 'add_doctor'),
(2, 'Can change doctor', 1, 'change_doctor'),
(3, 'Can delete doctor', 1, 'delete_doctor'),
(4, 'Can view doctor', 1, 'view_doctor'),
(5, 'Can add user', 2, 'add_patient'),
(6, 'Can change user', 2, 'change_patient'),
(7, 'Can delete user', 2, 'delete_patient'),
(8, 'Can view user', 2, 'view_patient'),
(9, 'Can add schedule', 3, 'add_schedule'),
(10, 'Can change schedule', 3, 'change_schedule'),
(11, 'Can delete schedule', 3, 'delete_schedule'),
(12, 'Can view schedule', 3, 'view_schedule'),
(13, 'Can add appointment', 4, 'add_appointment'),
(14, 'Can change appointment', 4, 'change_appointment'),
(15, 'Can delete appointment', 4, 'delete_appointment'),
(16, 'Can view appointment', 4, 'view_appointment'),
(17, 'Can add log entry', 5, 'add_logentry'),
(18, 'Can change log entry', 5, 'change_logentry'),
(19, 'Can delete log entry', 5, 'delete_logentry'),
(20, 'Can view log entry', 5, 'view_logentry'),
(21, 'Can add permission', 6, 'add_permission'),
(22, 'Can change permission', 6, 'change_permission'),
(23, 'Can delete permission', 6, 'delete_permission'),
(24, 'Can view permission', 6, 'view_permission'),
(25, 'Can add group', 7, 'add_group'),
(26, 'Can change group', 7, 'change_group'),
(27, 'Can delete group', 7, 'delete_group'),
(28, 'Can view group', 7, 'view_group'),
(29, 'Can add content type', 8, 'add_contenttype'),
(30, 'Can change content type', 8, 'change_contenttype'),
(31, 'Can delete content type', 8, 'delete_contenttype'),
(32, 'Can view content type', 8, 'view_contenttype'),
(33, 'Can add session', 9, 'add_session'),
(34, 'Can change session', 9, 'change_session'),
(35, 'Can delete session', 9, 'delete_session'),
(36, 'Can view session', 9, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-10-10 05:29:34.837209', '1', 'Doctor object (1)', 1, '[{\"added\": {}}]', 1, 1),
(2, '2023-10-10 05:29:59.470325', '2', 'Doctor object (2)', 1, '[{\"added\": {}}]', 1, 1),
(3, '2023-10-10 05:30:22.020036', '1', 'Schedule object (1)', 1, '[{\"added\": {}}]', 3, 1),
(4, '2023-10-10 05:30:39.167534', '2', 'Schedule object (2)', 1, '[{\"added\": {}}]', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(5, 'admin', 'logentry'),
(7, 'auth', 'group'),
(6, 'auth', 'permission'),
(8, 'contenttypes', 'contenttype'),
(4, 'myapp', 'appointment'),
(1, 'myapp', 'doctor'),
(2, 'myapp', 'patient'),
(3, 'myapp', 'schedule'),
(9, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-10 05:27:40.605692'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-10-10 05:27:40.676756'),
(3, 'auth', '0001_initial', '2023-10-10 05:27:41.027785'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-10-10 05:27:41.077551'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-10-10 05:27:41.086067'),
(6, 'auth', '0004_alter_user_username_opts', '2023-10-10 05:27:41.098594'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-10-10 05:27:41.110082'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-10-10 05:27:41.112599'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-10-10 05:27:41.123228'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-10-10 05:27:41.131717'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-10-10 05:27:41.147807'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-10-10 05:27:41.177529'),
(13, 'auth', '0011_update_proxy_permissions', '2023-10-10 05:27:41.189042'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-10-10 05:27:41.198549'),
(15, 'myapp', '0001_initial', '2023-10-10 05:27:41.643799'),
(16, 'admin', '0001_initial', '2023-10-10 05:27:41.873163'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-10-10 05:27:41.891660'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-10 05:27:41.910685'),
(19, 'myapp', '0002_auto_20230923_1247', '2023-10-10 05:27:42.040666'),
(20, 'myapp', '0003_appointment', '2023-10-10 05:27:42.257177'),
(21, 'sessions', '0001_initial', '2023-10-10 05:27:42.396794');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('canrpuzb5c8fd31n28m9tt4ag14noiso', '.eJxVjMsOwiAQRf-FtSEM5VFcuvcbyDADUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZnAeL0uyWkR2474Du22yxpbusyJbkr8qBdXmfOz8vh_h1U7PVb65SLI1IOnLZQ0qC8cTagDwMHRj0qz0ablDKNhsBbXxyQAuNKLh6teH8A16E3pA:1qq5pI:aK5oXnr6iEHwDZWe2wjUjsJ5IUjpn_yEp10fLhBagdU', '2023-10-24 06:02:40.213329');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_appointment`
--

CREATE TABLE `myapp_appointment` (
  `appid` int(11) NOT NULL,
  `appmadeon` date NOT NULL,
  `appdate` date NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_appointment`
--

INSERT INTO `myapp_appointment` (`appid`, `appmadeon`, `appdate`, `doctor_id`, `patient_id`) VALUES
(1, '2023-10-10', '2023-10-15', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_doctor`
--

CREATE TABLE `myapp_doctor` (
  `did` int(11) NOT NULL,
  `dname` varchar(200) NOT NULL,
  `degree` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `yoe` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_doctor`
--

INSERT INTO `myapp_doctor` (`did`, `dname`, `degree`, `specialization`, `contact`, `yoe`) VALUES
(1, 'Rahul Sinha', 'MBBS, MD', 'Gynecologist', '9876543210', '9'),
(2, 'Amit Roy', 'MBBS, MD, MS', 'Prediatrics', '8901234567', '15');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_patient`
--

CREATE TABLE `myapp_patient` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `age` varchar(3) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_patient`
--

INSERT INTO `myapp_patient` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `mobile`, `age`, `gender`) VALUES
(1, 'pbkdf2_sha256$260000$GyJy6DhNy8zH4Bg0N5Lwwg$cL/O8AjmFv8v1mekAB6LRKzaV8DeDUc9Pcab2C22zXk=', '2023-10-10 06:02:40.210369', 1, 'admin', '', '', 'saumitra@euphoriagenx.com', 1, 1, '2023-10-10 05:28:29.613564', '', '', ''),
(2, 'pbkdf2_sha256$260000$eDuUEicNOsvmzSLQQGqkpt$AugbmEfHOHQ01iKpYSGBS3QQX3s9jsHGgU1+IGCzMvY=', '2023-10-10 05:59:32.068169', 0, 'rahul', 'Rahul', 'Gupta', 'rahul@gmail.com', 0, 1, '2023-10-10 05:31:49.812938', '9876543210', '5', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_patient_groups`
--

CREATE TABLE `myapp_patient_groups` (
  `id` bigint(20) NOT NULL,
  `patient_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `myapp_patient_user_permissions`
--

CREATE TABLE `myapp_patient_user_permissions` (
  `id` bigint(20) NOT NULL,
  `patient_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `myapp_schedule`
--

CREATE TABLE `myapp_schedule` (
  `sid` int(11) NOT NULL,
  `days` varchar(255) NOT NULL,
  `time_slot` varchar(200) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_schedule`
--

INSERT INTO `myapp_schedule` (`sid`, `days`, `time_slot`, `doctor_id`) VALUES
(1, 'Sunday Wednesday', '5PM to 7:30PM', 2),
(2, 'Tuesday Thursday', '4PM to 6PM', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_myapp_patient_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `myapp_appointment`
--
ALTER TABLE `myapp_appointment`
  ADD PRIMARY KEY (`appid`),
  ADD KEY `myapp_appointment_doctor_id_706d799e_fk_myapp_doctor_did` (`doctor_id`),
  ADD KEY `myapp_appointment_patient_id_786a3ad1_fk_myapp_patient_id` (`patient_id`);

--
-- Indexes for table `myapp_doctor`
--
ALTER TABLE `myapp_doctor`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `myapp_patient`
--
ALTER TABLE `myapp_patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `myapp_patient_groups`
--
ALTER TABLE `myapp_patient_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `myapp_patient_groups_patient_id_group_id_660ed17a_uniq` (`patient_id`,`group_id`),
  ADD KEY `myapp_patient_groups_group_id_2b7c6c8a_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `myapp_patient_user_permissions`
--
ALTER TABLE `myapp_patient_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `myapp_patient_user_permi_patient_id_permission_id_80346cb8_uniq` (`patient_id`,`permission_id`),
  ADD KEY `myapp_patient_user_p_permission_id_83e72c55_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `myapp_schedule`
--
ALTER TABLE `myapp_schedule`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `myapp_schedule_doctor_id_1d8cb255_fk_myapp_doctor_did` (`doctor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `myapp_appointment`
--
ALTER TABLE `myapp_appointment`
  MODIFY `appid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_doctor`
--
ALTER TABLE `myapp_doctor`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `myapp_patient`
--
ALTER TABLE `myapp_patient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `myapp_patient_groups`
--
ALTER TABLE `myapp_patient_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myapp_patient_user_permissions`
--
ALTER TABLE `myapp_patient_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myapp_schedule`
--
ALTER TABLE `myapp_schedule`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_myapp_patient_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_patient` (`id`);

--
-- Constraints for table `myapp_appointment`
--
ALTER TABLE `myapp_appointment`
  ADD CONSTRAINT `myapp_appointment_doctor_id_706d799e_fk_myapp_doctor_did` FOREIGN KEY (`doctor_id`) REFERENCES `myapp_doctor` (`did`),
  ADD CONSTRAINT `myapp_appointment_patient_id_786a3ad1_fk_myapp_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `myapp_patient` (`id`);

--
-- Constraints for table `myapp_patient_groups`
--
ALTER TABLE `myapp_patient_groups`
  ADD CONSTRAINT `myapp_patient_groups_group_id_2b7c6c8a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `myapp_patient_groups_patient_id_204c6257_fk_myapp_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `myapp_patient` (`id`);

--
-- Constraints for table `myapp_patient_user_permissions`
--
ALTER TABLE `myapp_patient_user_permissions`
  ADD CONSTRAINT `myapp_patient_user_p_patient_id_45c371ca_fk_myapp_pat` FOREIGN KEY (`patient_id`) REFERENCES `myapp_patient` (`id`),
  ADD CONSTRAINT `myapp_patient_user_p_permission_id_83e72c55_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `myapp_schedule`
--
ALTER TABLE `myapp_schedule`
  ADD CONSTRAINT `myapp_schedule_doctor_id_1d8cb255_fk_myapp_doctor_did` FOREIGN KEY (`doctor_id`) REFERENCES `myapp_doctor` (`did`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

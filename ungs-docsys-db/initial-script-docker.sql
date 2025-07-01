--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.0

-- Started on 2025-06-29 16:54:11

--SET statement_timeout = 0;
--SET lock_timeout = 0;
--SET idle_in_transaction_session_timeout = 0;
--SET transaction_timeout = 0;
--SET client_encoding = 'UTF8';
--SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
--SET check_function_bodies = false;
--SET xmloption = content;
--SET client_min_messages = warning;
--SET row_security = off;

-- DROP DATABASE docsys;
--
-- TOC entry 3634 (class 1262 OID 16404)
-- Name: docsys; Type: DATABASE; Schema: -; Owner: admin
--

-- CREATE DATABASE docsys WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


-- ALTER DATABASE docsys OWNER TO admin;

-- \connect docsys

-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET transaction_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
-- SET check_function_bodies = false;
-- SET xmloption = content;
-- SET client_min_messages = warning;
-- SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16405)
-- Name: recruitment; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA recruitment;


ALTER SCHEMA recruitment OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16417)
-- Name: app_user; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.app_user (
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    password_hash character varying(255) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.app_user OWNER TO admin;

--
-- TOC entry 220 (class 1259 OID 16416)
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.app_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.app_user_id_seq OWNER TO admin;

--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 220
-- Name: app_user_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.app_user_id_seq OWNED BY recruitment.app_user.id;


--
-- TOC entry 267 (class 1259 OID 24972)
-- Name: certification; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.certification (
    id bigint NOT NULL,
    name character varying(150),
    issue_date timestamp without time zone,
    expiration_date timestamp without time zone,
    certification_url character varying(250),
    resume_user_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.certification OWNER TO admin;

--
-- TOC entry 266 (class 1259 OID 24971)
-- Name: certification_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.certification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.certification_id_seq OWNER TO admin;

--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 266
-- Name: certification_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.certification_id_seq OWNED BY recruitment.certification.id;


--
-- TOC entry 259 (class 1259 OID 24922)
-- Name: contact; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.contact (
    id bigint NOT NULL,
    email character varying(100),
    phone character varying(20),
    address character varying(150),
    linkedin character varying(100),
    resume_user_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.contact OWNER TO admin;

--
-- TOC entry 258 (class 1259 OID 24921)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.contact_id_seq OWNER TO admin;

--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 258
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.contact_id_seq OWNED BY recruitment.contact.id;


--
-- TOC entry 261 (class 1259 OID 24934)
-- Name: education; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.education (
    id bigint NOT NULL,
    institute_name character varying(150),
    degree_level character varying(20),
    degree character varying(150),
    field_of_study character varying(150),
    resume_user_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.education OWNER TO admin;

--
-- TOC entry 260 (class 1259 OID 24933)
-- Name: education_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.education_id_seq OWNER TO admin;

--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 260
-- Name: education_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.education_id_seq OWNED BY recruitment.education.id;


--
-- TOC entry 263 (class 1259 OID 24946)
-- Name: experience; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.experience (
    id bigint NOT NULL,
    job_title character varying(150),
    company_name character varying(150),
    description character varying(5000),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    is_current boolean,
    resume_user_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.experience OWNER TO admin;

--
-- TOC entry 262 (class 1259 OID 24945)
-- Name: experience_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.experience_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.experience_id_seq OWNER TO admin;

--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 262
-- Name: experience_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.experience_id_seq OWNED BY recruitment.experience.id;


--
-- TOC entry 227 (class 1259 OID 16452)
-- Name: identification_type; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.identification_type (
    id bigint NOT NULL,
    code character varying(25) NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE recruitment.identification_type OWNER TO admin;

--
-- TOC entry 226 (class 1259 OID 16451)
-- Name: identification_type_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.identification_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.identification_type_id_seq OWNER TO admin;

--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 226
-- Name: identification_type_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.identification_type_id_seq OWNED BY recruitment.identification_type.id;


--
-- TOC entry 249 (class 1259 OID 16601)
-- Name: job_application; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.job_application (
    id bigint NOT NULL,
    code character varying(36) NOT NULL,
    title character varying(150) NOT NULL,
    description character varying(5000) NOT NULL,
    job_application_status_id bigint NOT NULL,
    job_application_period_id bigint NOT NULL,
    min_approvers bigint,
    reason character varying(500) NOT NULL,
    year_period bigint NOT NULL,
    active boolean NOT NULL,
    user_id_creator bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    job_profile_level_id bigint
);


ALTER TABLE recruitment.job_application OWNER TO admin;

--
-- TOC entry 251 (class 1259 OID 16620)
-- Name: job_application_approval; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.job_application_approval (
    id bigint NOT NULL,
    job_application_id bigint NOT NULL,
    approved boolean,
    reason character varying(500) NOT NULL,
    user_id_approval bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.job_application_approval OWNER TO admin;

--
-- TOC entry 250 (class 1259 OID 16619)
-- Name: job_application_approval_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.job_application_approval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.job_application_approval_id_seq OWNER TO admin;

--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 250
-- Name: job_application_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.job_application_approval_id_seq OWNED BY recruitment.job_application_approval.id;


--
-- TOC entry 248 (class 1259 OID 16600)
-- Name: job_application_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.job_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.job_application_id_seq OWNER TO admin;

--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 248
-- Name: job_application_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.job_application_id_seq OWNED BY recruitment.job_application.id;


--
-- TOC entry 245 (class 1259 OID 16577)
-- Name: job_application_period; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.job_application_period (
    id bigint NOT NULL,
    code character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE recruitment.job_application_period OWNER TO admin;

--
-- TOC entry 244 (class 1259 OID 16576)
-- Name: job_application_period_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.job_application_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.job_application_period_id_seq OWNER TO admin;

--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 244
-- Name: job_application_period_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.job_application_period_id_seq OWNED BY recruitment.job_application_period.id;


--
-- TOC entry 275 (class 1259 OID 25024)
-- Name: job_application_resume_user; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.job_application_resume_user (
    id bigint NOT NULL,
    job_application_id bigint NOT NULL,
    resume_user_id bigint NOT NULL,
    requirements_global_count bigint NOT NULL,
    requirements_mandatory_count bigint NOT NULL,
    requirements_prefered_count bigint NOT NULL,
    requirement_global_applied bigint NOT NULL,
    requirement_mandatory_applied bigint NOT NULL,
    requirement_prefered_applied bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.job_application_resume_user OWNER TO admin;

--
-- TOC entry 274 (class 1259 OID 25023)
-- Name: job_application_resume_user_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.job_application_resume_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.job_application_resume_user_id_seq OWNER TO admin;

--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 274
-- Name: job_application_resume_user_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.job_application_resume_user_id_seq OWNED BY recruitment.job_application_resume_user.id;


--
-- TOC entry 243 (class 1259 OID 16568)
-- Name: job_application_status; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.job_application_status (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE recruitment.job_application_status OWNER TO admin;

--
-- TOC entry 242 (class 1259 OID 16567)
-- Name: job_application_status_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.job_application_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.job_application_status_id_seq OWNER TO admin;

--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 242
-- Name: job_application_status_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.job_application_status_id_seq OWNED BY recruitment.job_application_status.id;


--
-- TOC entry 273 (class 1259 OID 25010)
-- Name: job_profile_level; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.job_profile_level (
    id bigint NOT NULL,
    level character varying(50) NOT NULL,
    description character varying(150) NOT NULL
);


ALTER TABLE recruitment.job_profile_level OWNER TO admin;

--
-- TOC entry 272 (class 1259 OID 25009)
-- Name: job_profile_level_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.job_profile_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.job_profile_level_id_seq OWNER TO admin;

--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 272
-- Name: job_profile_level_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.job_profile_level_id_seq OWNED BY recruitment.job_profile_level.id;


--
-- TOC entry 269 (class 1259 OID 24984)
-- Name: language; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.language (
    id bigint NOT NULL,
    language character varying(50),
    level character varying(50),
    resume_user_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.language OWNER TO admin;

--
-- TOC entry 268 (class 1259 OID 24983)
-- Name: language_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.language_id_seq OWNER TO admin;

--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 268
-- Name: language_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.language_id_seq OWNED BY recruitment.language.id;


--
-- TOC entry 225 (class 1259 OID 16440)
-- Name: loging_history; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.loging_history (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    login_time timestamp without time zone NOT NULL
);


ALTER TABLE recruitment.loging_history OWNER TO admin;

--
-- TOC entry 224 (class 1259 OID 16439)
-- Name: loging_history_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.loging_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.loging_history_id_seq OWNER TO admin;

--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 224
-- Name: loging_history_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.loging_history_id_seq OWNED BY recruitment.loging_history.id;


--
-- TOC entry 229 (class 1259 OID 16461)
-- Name: nationality; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.nationality (
    id bigint NOT NULL,
    code character varying(10) NOT NULL,
    description character varying(150) NOT NULL,
    iso_2 character varying(2) NOT NULL,
    iso_3 character varying(3) NOT NULL
);


ALTER TABLE recruitment.nationality OWNER TO admin;

--
-- TOC entry 228 (class 1259 OID 16460)
-- Name: nationality_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.nationality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.nationality_id_seq OWNER TO admin;

--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 228
-- Name: nationality_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.nationality_id_seq OWNED BY recruitment.nationality.id;


--
-- TOC entry 223 (class 1259 OID 16427)
-- Name: password_reset; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.password_reset (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    expiration_date timestamp without time zone NOT NULL,
    used boolean DEFAULT false NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.password_reset OWNER TO admin;

--
-- TOC entry 222 (class 1259 OID 16426)
-- Name: password_reset_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.password_reset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.password_reset_id_seq OWNER TO admin;

--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 222
-- Name: password_reset_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.password_reset_id_seq OWNED BY recruitment.password_reset.id;


--
-- TOC entry 237 (class 1259 OID 16525)
-- Name: permission; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.permission (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE recruitment.permission OWNER TO admin;

--
-- TOC entry 236 (class 1259 OID 16524)
-- Name: permission_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.permission_id_seq OWNER TO admin;

--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 236
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.permission_id_seq OWNED BY recruitment.permission.id;


--
-- TOC entry 247 (class 1259 OID 16587)
-- Name: requirement; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.requirement (
    id bigint NOT NULL,
    description character varying(500) NOT NULL,
    requirement_type_id bigint NOT NULL,
    operator character varying(25) NOT NULL,
    expected_value character varying(150) NOT NULL,
    active boolean NOT NULL,
    user_id_creator bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    requirement_target_comparator_id bigint NOT NULL
);


ALTER TABLE recruitment.requirement OWNER TO admin;

--
-- TOC entry 246 (class 1259 OID 16586)
-- Name: requirement_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.requirement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.requirement_id_seq OWNER TO admin;

--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 246
-- Name: requirement_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.requirement_id_seq OWNED BY recruitment.requirement.id;


--
-- TOC entry 253 (class 1259 OID 16639)
-- Name: requirement_job_application; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.requirement_job_application (
    id bigint NOT NULL,
    job_application_id bigint NOT NULL,
    requirement_id bigint NOT NULL
);


ALTER TABLE recruitment.requirement_job_application OWNER TO admin;

--
-- TOC entry 252 (class 1259 OID 16638)
-- Name: requirement_job_application_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.requirement_job_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.requirement_job_application_id_seq OWNER TO admin;

--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 252
-- Name: requirement_job_application_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.requirement_job_application_id_seq OWNED BY recruitment.requirement_job_application.id;


--
-- TOC entry 255 (class 1259 OID 16678)
-- Name: requirement_target_comparator; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.requirement_target_comparator (
    id bigint NOT NULL,
    name character varying(155) NOT NULL,
    description character varying(155) NOT NULL
);


ALTER TABLE recruitment.requirement_target_comparator OWNER TO admin;

--
-- TOC entry 254 (class 1259 OID 16677)
-- Name: requirement_target_comparator_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.requirement_target_comparator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.requirement_target_comparator_id_seq OWNER TO admin;

--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 254
-- Name: requirement_target_comparator_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.requirement_target_comparator_id_seq OWNED BY recruitment.requirement_target_comparator.id;


--
-- TOC entry 241 (class 1259 OID 16559)
-- Name: requirement_type; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.requirement_type (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE recruitment.requirement_type OWNER TO admin;

--
-- TOC entry 240 (class 1259 OID 16558)
-- Name: requirement_type_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.requirement_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.requirement_type_id_seq OWNER TO admin;

--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 240
-- Name: requirement_type_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.requirement_type_id_seq OWNED BY recruitment.requirement_type.id;


--
-- TOC entry 271 (class 1259 OID 24996)
-- Name: resume_file; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.resume_file (
    id bigint NOT NULL,
    file_binary character varying(5000),
    resume_user_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.resume_file OWNER TO admin;

--
-- TOC entry 270 (class 1259 OID 24995)
-- Name: resume_file_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.resume_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.resume_file_id_seq OWNER TO admin;

--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 270
-- Name: resume_file_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.resume_file_id_seq OWNED BY recruitment.resume_file.id;


--
-- TOC entry 257 (class 1259 OID 24910)
-- Name: resume_user; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.resume_user (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    is_current boolean NOT NULL
);


ALTER TABLE recruitment.resume_user OWNER TO admin;

--
-- TOC entry 256 (class 1259 OID 24909)
-- Name: resume_user_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.resume_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.resume_user_id_seq OWNER TO admin;

--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 256
-- Name: resume_user_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.resume_user_id_seq OWNED BY recruitment.resume_user.id;


--
-- TOC entry 233 (class 1259 OID 16492)
-- Name: role; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.role (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE recruitment.role OWNER TO admin;

--
-- TOC entry 232 (class 1259 OID 16491)
-- Name: role_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.role_id_seq OWNER TO admin;

--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 232
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.role_id_seq OWNED BY recruitment.role.id;


--
-- TOC entry 239 (class 1259 OID 16534)
-- Name: role_permission; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.role_permission (
    id bigint NOT NULL,
    role_id bigint NOT NULL,
    permission_id bigint NOT NULL
);


ALTER TABLE recruitment.role_permission OWNER TO admin;

--
-- TOC entry 238 (class 1259 OID 16533)
-- Name: role_permission_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.role_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.role_permission_id_seq OWNER TO admin;

--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 238
-- Name: role_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.role_permission_id_seq OWNED BY recruitment.role_permission.id;


--
-- TOC entry 265 (class 1259 OID 24960)
-- Name: technical_skill; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.technical_skill (
    id bigint NOT NULL,
    name character varying(150),
    level character varying(50),
    resume_user_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE recruitment.technical_skill OWNER TO admin;

--
-- TOC entry 264 (class 1259 OID 24959)
-- Name: technical_skill_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.technical_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.technical_skill_id_seq OWNER TO admin;

--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 264
-- Name: technical_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.technical_skill_id_seq OWNED BY recruitment.technical_skill.id;


--
-- TOC entry 231 (class 1259 OID 16470)
-- Name: user_info; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.user_info (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    identification_type_id bigint NOT NULL,
    identification_number character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    birth_date date NOT NULL,
    nationality_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    cuil_cuit character varying(11) NOT NULL
);


ALTER TABLE recruitment.user_info OWNER TO admin;

--
-- TOC entry 230 (class 1259 OID 16469)
-- Name: user_info_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.user_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.user_info_id_seq OWNER TO admin;

--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 230
-- Name: user_info_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.user_info_id_seq OWNED BY recruitment.user_info.id;


--
-- TOC entry 235 (class 1259 OID 16501)
-- Name: user_role; Type: TABLE; Schema: recruitment; Owner: admin
--

CREATE TABLE recruitment.user_role (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE recruitment.user_role OWNER TO admin;

--
-- TOC entry 234 (class 1259 OID 16500)
-- Name: user_role_id_seq; Type: SEQUENCE; Schema: recruitment; Owner: admin
--

CREATE SEQUENCE recruitment.user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE recruitment.user_role_id_seq OWNER TO admin;

--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 234
-- Name: user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: recruitment; Owner: admin
--

ALTER SEQUENCE recruitment.user_role_id_seq OWNED BY recruitment.user_role.id;


--
-- TOC entry 3350 (class 2604 OID 16420)
-- Name: app_user id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.app_user ALTER COLUMN id SET DEFAULT nextval('recruitment.app_user_id_seq'::regclass);


--
-- TOC entry 3375 (class 2604 OID 24975)
-- Name: certification id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.certification ALTER COLUMN id SET DEFAULT nextval('recruitment.certification_id_seq'::regclass);


--
-- TOC entry 3371 (class 2604 OID 24925)
-- Name: contact id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.contact ALTER COLUMN id SET DEFAULT nextval('recruitment.contact_id_seq'::regclass);


--
-- TOC entry 3372 (class 2604 OID 24937)
-- Name: education id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.education ALTER COLUMN id SET DEFAULT nextval('recruitment.education_id_seq'::regclass);


--
-- TOC entry 3373 (class 2604 OID 24949)
-- Name: experience id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.experience ALTER COLUMN id SET DEFAULT nextval('recruitment.experience_id_seq'::regclass);


--
-- TOC entry 3355 (class 2604 OID 16455)
-- Name: identification_type id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.identification_type ALTER COLUMN id SET DEFAULT nextval('recruitment.identification_type_id_seq'::regclass);


--
-- TOC entry 3366 (class 2604 OID 16604)
-- Name: job_application id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application ALTER COLUMN id SET DEFAULT nextval('recruitment.job_application_id_seq'::regclass);


--
-- TOC entry 3367 (class 2604 OID 16623)
-- Name: job_application_approval id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_approval ALTER COLUMN id SET DEFAULT nextval('recruitment.job_application_approval_id_seq'::regclass);


--
-- TOC entry 3364 (class 2604 OID 16580)
-- Name: job_application_period id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_period ALTER COLUMN id SET DEFAULT nextval('recruitment.job_application_period_id_seq'::regclass);


--
-- TOC entry 3379 (class 2604 OID 25027)
-- Name: job_application_resume_user id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_resume_user ALTER COLUMN id SET DEFAULT nextval('recruitment.job_application_resume_user_id_seq'::regclass);


--
-- TOC entry 3363 (class 2604 OID 16571)
-- Name: job_application_status id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_status ALTER COLUMN id SET DEFAULT nextval('recruitment.job_application_status_id_seq'::regclass);


--
-- TOC entry 3378 (class 2604 OID 25013)
-- Name: job_profile_level id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_profile_level ALTER COLUMN id SET DEFAULT nextval('recruitment.job_profile_level_id_seq'::regclass);


--
-- TOC entry 3376 (class 2604 OID 24987)
-- Name: language id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.language ALTER COLUMN id SET DEFAULT nextval('recruitment.language_id_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 16443)
-- Name: loging_history id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.loging_history ALTER COLUMN id SET DEFAULT nextval('recruitment.loging_history_id_seq'::regclass);


--
-- TOC entry 3356 (class 2604 OID 16464)
-- Name: nationality id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.nationality ALTER COLUMN id SET DEFAULT nextval('recruitment.nationality_id_seq'::regclass);


--
-- TOC entry 3352 (class 2604 OID 16430)
-- Name: password_reset id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.password_reset ALTER COLUMN id SET DEFAULT nextval('recruitment.password_reset_id_seq'::regclass);


--
-- TOC entry 3360 (class 2604 OID 16528)
-- Name: permission id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.permission ALTER COLUMN id SET DEFAULT nextval('recruitment.permission_id_seq'::regclass);


--
-- TOC entry 3365 (class 2604 OID 16590)
-- Name: requirement id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement ALTER COLUMN id SET DEFAULT nextval('recruitment.requirement_id_seq'::regclass);


--
-- TOC entry 3368 (class 2604 OID 16642)
-- Name: requirement_job_application id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement_job_application ALTER COLUMN id SET DEFAULT nextval('recruitment.requirement_job_application_id_seq'::regclass);


--
-- TOC entry 3369 (class 2604 OID 16681)
-- Name: requirement_target_comparator id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement_target_comparator ALTER COLUMN id SET DEFAULT nextval('recruitment.requirement_target_comparator_id_seq'::regclass);


--
-- TOC entry 3362 (class 2604 OID 16562)
-- Name: requirement_type id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement_type ALTER COLUMN id SET DEFAULT nextval('recruitment.requirement_type_id_seq'::regclass);


--
-- TOC entry 3377 (class 2604 OID 24999)
-- Name: resume_file id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.resume_file ALTER COLUMN id SET DEFAULT nextval('recruitment.resume_file_id_seq'::regclass);


--
-- TOC entry 3370 (class 2604 OID 24913)
-- Name: resume_user id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.resume_user ALTER COLUMN id SET DEFAULT nextval('recruitment.resume_user_id_seq'::regclass);


--
-- TOC entry 3358 (class 2604 OID 16495)
-- Name: role id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.role ALTER COLUMN id SET DEFAULT nextval('recruitment.role_id_seq'::regclass);


--
-- TOC entry 3361 (class 2604 OID 16537)
-- Name: role_permission id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.role_permission ALTER COLUMN id SET DEFAULT nextval('recruitment.role_permission_id_seq'::regclass);


--
-- TOC entry 3374 (class 2604 OID 24963)
-- Name: technical_skill id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.technical_skill ALTER COLUMN id SET DEFAULT nextval('recruitment.technical_skill_id_seq'::regclass);


--
-- TOC entry 3357 (class 2604 OID 16473)
-- Name: user_info id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.user_info ALTER COLUMN id SET DEFAULT nextval('recruitment.user_info_id_seq'::regclass);


--
-- TOC entry 3359 (class 2604 OID 16504)
-- Name: user_role id; Type: DEFAULT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.user_role ALTER COLUMN id SET DEFAULT nextval('recruitment.user_role_id_seq'::regclass);


--
-- TOC entry 3381 (class 2606 OID 16425)
-- Name: app_user app_user_email_key; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.app_user
    ADD CONSTRAINT app_user_email_key UNIQUE (email);


--
-- TOC entry 3383 (class 2606 OID 16423)
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3443 (class 2606 OID 24977)
-- Name: certification certification_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.certification
    ADD CONSTRAINT certification_pkey PRIMARY KEY (id);


--
-- TOC entry 3435 (class 2606 OID 24927)
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- TOC entry 3437 (class 2606 OID 24939)
-- Name: education education_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);


--
-- TOC entry 3439 (class 2606 OID 24953)
-- Name: experience experience_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.experience
    ADD CONSTRAINT experience_pkey PRIMARY KEY (id);


--
-- TOC entry 3389 (class 2606 OID 16459)
-- Name: identification_type identification_type_code_key; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.identification_type
    ADD CONSTRAINT identification_type_code_key UNIQUE (code);


--
-- TOC entry 3391 (class 2606 OID 16457)
-- Name: identification_type identification_type_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.identification_type
    ADD CONSTRAINT identification_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3427 (class 2606 OID 16627)
-- Name: job_application_approval job_application_approval_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_approval
    ADD CONSTRAINT job_application_approval_pkey PRIMARY KEY (id);


--
-- TOC entry 3419 (class 2606 OID 16584)
-- Name: job_application_period job_application_period_code_key; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_period
    ADD CONSTRAINT job_application_period_code_key UNIQUE (code);


--
-- TOC entry 3421 (class 2606 OID 16582)
-- Name: job_application_period job_application_period_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_period
    ADD CONSTRAINT job_application_period_pkey PRIMARY KEY (id);


--
-- TOC entry 3425 (class 2606 OID 16608)
-- Name: job_application job_application_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application
    ADD CONSTRAINT job_application_pkey PRIMARY KEY (id);


--
-- TOC entry 3453 (class 2606 OID 25029)
-- Name: job_application_resume_user job_application_resume_user_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_resume_user
    ADD CONSTRAINT job_application_resume_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3415 (class 2606 OID 16575)
-- Name: job_application_status job_application_status_name_key; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_status
    ADD CONSTRAINT job_application_status_name_key UNIQUE (name);


--
-- TOC entry 3417 (class 2606 OID 16573)
-- Name: job_application_status job_application_status_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_status
    ADD CONSTRAINT job_application_status_pkey PRIMARY KEY (id);


--
-- TOC entry 3449 (class 2606 OID 25017)
-- Name: job_profile_level job_profile_level_level_key; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_profile_level
    ADD CONSTRAINT job_profile_level_level_key UNIQUE (level);


--
-- TOC entry 3451 (class 2606 OID 25015)
-- Name: job_profile_level job_profile_level_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_profile_level
    ADD CONSTRAINT job_profile_level_pkey PRIMARY KEY (id);


--
-- TOC entry 3445 (class 2606 OID 24989)
-- Name: language language_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- TOC entry 3387 (class 2606 OID 16445)
-- Name: loging_history loging_history_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.loging_history
    ADD CONSTRAINT loging_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3393 (class 2606 OID 16661)
-- Name: nationality nationality_code_key; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.nationality
    ADD CONSTRAINT nationality_code_key UNIQUE (code);


--
-- TOC entry 3395 (class 2606 OID 16466)
-- Name: nationality nationality_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.nationality
    ADD CONSTRAINT nationality_pkey PRIMARY KEY (id);


--
-- TOC entry 3385 (class 2606 OID 16433)
-- Name: password_reset password_reset_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.password_reset
    ADD CONSTRAINT password_reset_pkey PRIMARY KEY (id);


--
-- TOC entry 3405 (class 2606 OID 16532)
-- Name: permission permission_name_key; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.permission
    ADD CONSTRAINT permission_name_key UNIQUE (name);


--
-- TOC entry 3407 (class 2606 OID 16530)
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3429 (class 2606 OID 16644)
-- Name: requirement_job_application requirement_job_application_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement_job_application
    ADD CONSTRAINT requirement_job_application_pkey PRIMARY KEY (id);


--
-- TOC entry 3423 (class 2606 OID 16594)
-- Name: requirement requirement_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement
    ADD CONSTRAINT requirement_pkey PRIMARY KEY (id);


--
-- TOC entry 3431 (class 2606 OID 16683)
-- Name: requirement_target_comparator requirement_target_comparator_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement_target_comparator
    ADD CONSTRAINT requirement_target_comparator_pkey PRIMARY KEY (id);


--
-- TOC entry 3411 (class 2606 OID 16566)
-- Name: requirement_type requirement_type_name_key; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement_type
    ADD CONSTRAINT requirement_type_name_key UNIQUE (name);


--
-- TOC entry 3413 (class 2606 OID 16564)
-- Name: requirement_type requirement_type_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement_type
    ADD CONSTRAINT requirement_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3447 (class 2606 OID 25003)
-- Name: resume_file resume_file_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.resume_file
    ADD CONSTRAINT resume_file_pkey PRIMARY KEY (id);


--
-- TOC entry 3433 (class 2606 OID 24915)
-- Name: resume_user resume_user_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.resume_user
    ADD CONSTRAINT resume_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3399 (class 2606 OID 16499)
-- Name: role role_name_key; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- TOC entry 3409 (class 2606 OID 16539)
-- Name: role_permission role_permission_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.role_permission
    ADD CONSTRAINT role_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3401 (class 2606 OID 16497)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 3441 (class 2606 OID 24965)
-- Name: technical_skill technical_skill_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.technical_skill
    ADD CONSTRAINT technical_skill_pkey PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 16475)
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (id);


--
-- TOC entry 3403 (class 2606 OID 16506)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3479 (class 2606 OID 24978)
-- Name: certification fk_certification_resume_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.certification
    ADD CONSTRAINT fk_certification_resume_user FOREIGN KEY (resume_user_id) REFERENCES recruitment.resume_user(id) ON DELETE CASCADE;


--
-- TOC entry 3475 (class 2606 OID 24928)
-- Name: contact fk_contact_resume_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.contact
    ADD CONSTRAINT fk_contact_resume_user FOREIGN KEY (resume_user_id) REFERENCES recruitment.resume_user(id) ON DELETE CASCADE;


--
-- TOC entry 3476 (class 2606 OID 24940)
-- Name: education fk_education_resume_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.education
    ADD CONSTRAINT fk_education_resume_user FOREIGN KEY (resume_user_id) REFERENCES recruitment.resume_user(id) ON DELETE CASCADE;


--
-- TOC entry 3477 (class 2606 OID 24954)
-- Name: experience fk_experience_resume_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.experience
    ADD CONSTRAINT fk_experience_resume_user FOREIGN KEY (resume_user_id) REFERENCES recruitment.resume_user(id) ON DELETE CASCADE;


--
-- TOC entry 3470 (class 2606 OID 16628)
-- Name: job_application_approval fk_job_application_approval_job_application; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_approval
    ADD CONSTRAINT fk_job_application_approval_job_application FOREIGN KEY (job_application_id) REFERENCES recruitment.job_application(id) ON DELETE CASCADE;


--
-- TOC entry 3471 (class 2606 OID 16633)
-- Name: job_application_approval fk_job_application_approval_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_approval
    ADD CONSTRAINT fk_job_application_approval_user FOREIGN KEY (user_id_approval) REFERENCES recruitment.app_user(id) ON DELETE CASCADE;


--
-- TOC entry 3466 (class 2606 OID 16655)
-- Name: job_application fk_job_application_job_app_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application
    ADD CONSTRAINT fk_job_application_job_app_user FOREIGN KEY (user_id_creator) REFERENCES recruitment.app_user(id) ON DELETE CASCADE;


--
-- TOC entry 3467 (class 2606 OID 16609)
-- Name: job_application fk_job_application_job_application_period; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application
    ADD CONSTRAINT fk_job_application_job_application_period FOREIGN KEY (job_application_status_id) REFERENCES recruitment.job_application_status(id) ON DELETE CASCADE;


--
-- TOC entry 3468 (class 2606 OID 16614)
-- Name: job_application fk_job_application_job_application_status; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application
    ADD CONSTRAINT fk_job_application_job_application_status FOREIGN KEY (job_application_period_id) REFERENCES recruitment.job_application_period(id) ON DELETE CASCADE;


--
-- TOC entry 3469 (class 2606 OID 25018)
-- Name: job_application fk_job_application_job_profile_level; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application
    ADD CONSTRAINT fk_job_application_job_profile_level FOREIGN KEY (job_profile_level_id) REFERENCES recruitment.job_profile_level(id) ON DELETE CASCADE;


--
-- TOC entry 3482 (class 2606 OID 25035)
-- Name: job_application_resume_user fk_job_application_resume_user_job_application; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_resume_user
    ADD CONSTRAINT fk_job_application_resume_user_job_application FOREIGN KEY (job_application_id) REFERENCES recruitment.job_application(id) ON DELETE CASCADE;


--
-- TOC entry 3483 (class 2606 OID 25030)
-- Name: job_application_resume_user fk_job_application_resume_user_resume_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.job_application_resume_user
    ADD CONSTRAINT fk_job_application_resume_user_resume_user FOREIGN KEY (resume_user_id) REFERENCES recruitment.resume_user(id) ON DELETE CASCADE;


--
-- TOC entry 3480 (class 2606 OID 24990)
-- Name: language fk_language_resume_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.language
    ADD CONSTRAINT fk_language_resume_user FOREIGN KEY (resume_user_id) REFERENCES recruitment.resume_user(id) ON DELETE CASCADE;


--
-- TOC entry 3455 (class 2606 OID 16446)
-- Name: loging_history fk_loging_history_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.loging_history
    ADD CONSTRAINT fk_loging_history_user FOREIGN KEY (user_id) REFERENCES recruitment.app_user(id) ON DELETE CASCADE;


--
-- TOC entry 3454 (class 2606 OID 16434)
-- Name: password_reset fk_password_reset_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.password_reset
    ADD CONSTRAINT fk_password_reset_user FOREIGN KEY (user_id) REFERENCES recruitment.app_user(id) ON DELETE CASCADE;


--
-- TOC entry 3463 (class 2606 OID 16667)
-- Name: requirement fk_requirement_app_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement
    ADD CONSTRAINT fk_requirement_app_user FOREIGN KEY (user_id_creator) REFERENCES recruitment.app_user(id) ON DELETE CASCADE;


--
-- TOC entry 3472 (class 2606 OID 16645)
-- Name: requirement_job_application fk_requirement_job_application_job_application; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement_job_application
    ADD CONSTRAINT fk_requirement_job_application_job_application FOREIGN KEY (job_application_id) REFERENCES recruitment.job_application(id) ON DELETE CASCADE;


--
-- TOC entry 3473 (class 2606 OID 16650)
-- Name: requirement_job_application fk_requirement_job_application_requirement; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement_job_application
    ADD CONSTRAINT fk_requirement_job_application_requirement FOREIGN KEY (requirement_id) REFERENCES recruitment.requirement(id) ON DELETE CASCADE;


--
-- TOC entry 3464 (class 2606 OID 16684)
-- Name: requirement fk_requirement_requirement_target_comparator_id; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement
    ADD CONSTRAINT fk_requirement_requirement_target_comparator_id FOREIGN KEY (requirement_target_comparator_id) REFERENCES recruitment.requirement_target_comparator(id) ON DELETE CASCADE;


--
-- TOC entry 3465 (class 2606 OID 16672)
-- Name: requirement fk_requirement_requirement_type; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.requirement
    ADD CONSTRAINT fk_requirement_requirement_type FOREIGN KEY (requirement_type_id) REFERENCES recruitment.requirement_type(id) ON DELETE CASCADE;


--
-- TOC entry 3481 (class 2606 OID 25004)
-- Name: resume_file fk_resume_file_resume_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.resume_file
    ADD CONSTRAINT fk_resume_file_resume_user FOREIGN KEY (resume_user_id) REFERENCES recruitment.resume_user(id) ON DELETE CASCADE;


--
-- TOC entry 3474 (class 2606 OID 24916)
-- Name: resume_user fk_resume_user_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.resume_user
    ADD CONSTRAINT fk_resume_user_user FOREIGN KEY (user_id) REFERENCES recruitment.app_user(id) ON DELETE CASCADE;


--
-- TOC entry 3461 (class 2606 OID 16540)
-- Name: role_permission fk_role_permission_permission; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.role_permission
    ADD CONSTRAINT fk_role_permission_permission FOREIGN KEY (permission_id) REFERENCES recruitment.permission(id) ON DELETE CASCADE;


--
-- TOC entry 3462 (class 2606 OID 16545)
-- Name: role_permission fk_role_permission_role; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.role_permission
    ADD CONSTRAINT fk_role_permission_role FOREIGN KEY (role_id) REFERENCES recruitment.role(id) ON DELETE CASCADE;


--
-- TOC entry 3478 (class 2606 OID 24966)
-- Name: technical_skill fk_technical_skill_resume_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.technical_skill
    ADD CONSTRAINT fk_technical_skill_resume_user FOREIGN KEY (resume_user_id) REFERENCES recruitment.resume_user(id) ON DELETE CASCADE;


--
-- TOC entry 3456 (class 2606 OID 16481)
-- Name: user_info fk_user_info_identification_type; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.user_info
    ADD CONSTRAINT fk_user_info_identification_type FOREIGN KEY (identification_type_id) REFERENCES recruitment.identification_type(id) ON DELETE CASCADE;


--
-- TOC entry 3457 (class 2606 OID 16486)
-- Name: user_info fk_user_info_nationality; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.user_info
    ADD CONSTRAINT fk_user_info_nationality FOREIGN KEY (nationality_id) REFERENCES recruitment.nationality(id) ON DELETE CASCADE;


--
-- TOC entry 3458 (class 2606 OID 16476)
-- Name: user_info fk_user_info_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.user_info
    ADD CONSTRAINT fk_user_info_user FOREIGN KEY (user_id) REFERENCES recruitment.app_user(id) ON DELETE CASCADE;


--
-- TOC entry 3459 (class 2606 OID 16512)
-- Name: user_role fk_user_role_role; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.user_role
    ADD CONSTRAINT fk_user_role_role FOREIGN KEY (role_id) REFERENCES recruitment.role(id) ON DELETE CASCADE;


--
-- TOC entry 3460 (class 2606 OID 16507)
-- Name: user_role fk_user_role_user; Type: FK CONSTRAINT; Schema: recruitment; Owner: admin
--

ALTER TABLE ONLY recruitment.user_role
    ADD CONSTRAINT fk_user_role_user FOREIGN KEY (user_id) REFERENCES recruitment.app_user(id) ON DELETE CASCADE;


-- Completed on 2025-06-29 16:54:11

--
-- PostgreSQL database dump complete
--

INSERT INTO recruitment.job_application_status (id,"name",description) VALUES
	 (1,'PENDING_APPROVAL','Pendiente de aprobación'),
	 (2,'APPROVED','Aprobado'),
	 (3,'PUBLISHED','Publicado'),
	 (4,'DECLINED','Rechazado');
	 
INSERT INTO recruitment.requirement_type (id,"name",description) VALUES
	 (1,'GLOBAL','Global'),
	 (2,'MANDATORY','Excluyente'),
	 (3,'PREFERRED','Deseable');

INSERT INTO recruitment."role" (id,"name",description) VALUES
	 (1,'RECRUITER','Recruiter'),
	 (2,'CANDIDATE','Candidate');
	 
INSERT INTO recruitment.job_application_period (id,code,description) VALUES
	 (1,'FIRST_SEMESTER','1er semestre'),
	 (2,'SECOND_SEMESTER','2do semestre');

INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Afghanistan', 'AF', 'AFG', '004');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Albania', 'AL', 'ALB', '008');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Algeria', 'DZ', 'DZA', '012');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('American Samoa', 'AS', 'ASM', '016');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Andorra', 'AD', 'AND', '020');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Angola', 'AO', 'AGO', '024');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Anguilla', 'AI', 'AIA', '660');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Antarctica', 'AQ', 'ATA', '010');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Antigua and Barbuda', 'AG', 'ATG', '028');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Argentina', 'AR', 'ARG', '032');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Armenia', 'AM', 'ARM', '051');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Aruba', 'AW', 'ABW', '533');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Australia', 'AU', 'AUS', '036');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Austria', 'AT', 'AUT', '040');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Azerbaijan', 'AZ', 'AZE', '031');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Bahamas (the)', 'BS', 'BHS', '044');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Bahrain', 'BH', 'BHR', '048');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Bangladesh', 'BD', 'BGD', '050');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Barbados', 'BB', 'BRB', '052');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Belarus', 'BY', 'BLR', '112');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Belgium', 'BE', 'BEL', '056');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Belize', 'BZ', 'BLZ', '084');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Benin', 'BJ', 'BEN', '204');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Bermuda', 'BM', 'BMU', '060');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Bhutan', 'BT', 'BTN', '064');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Bolivia (Plurinational State of)', 'BO', 'BOL', '068');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '535');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Bosnia and Herzegovina', 'BA', 'BIH', '070');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Botswana', 'BW', 'BWA', '072');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Bouvet Island', 'BV', 'BVT', '074');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Brazil', 'BR', 'BRA', '076');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('British Indian Ocean Territory (the)', 'IO', 'IOT', '086');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Brunei Darussalam', 'BN', 'BRN', '096');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Bulgaria', 'BG', 'BGR', '100');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Burkina Faso', 'BF', 'BFA', '854');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Burundi', 'BI', 'BDI', '108');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Cabo Verde', 'CV', 'CPV', '132');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Cambodia', 'KH', 'KHM', '116');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Cameroon', 'CM', 'CMR', '120');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Canada', 'CA', 'CAN', '124');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Cayman Islands (the)', 'KY', 'CYM', '136');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Central African Republic (the)', 'CF', 'CAF', '140');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Chad', 'TD', 'TCD', '148');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Chile', 'CL', 'CHL', '152');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('China', 'CN', 'CHN', '156');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Christmas Island', 'CX', 'CXR', '162');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Cocos (Keeling) Islands (the)', 'CC', 'CCK', '166');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Colombia', 'CO', 'COL', '170');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Comoros (the)', 'KM', 'COM', '174');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Congo (the Democratic Republic of the)', 'CD', 'COD', '180');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Congo (the)', 'CG', 'COG', '178');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Cook Islands (the)', 'CK', 'COK', '184');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Costa Rica', 'CR', 'CRI', '188');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Croatia', 'HR', 'HRV', '191');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Cuba', 'CU', 'CUB', '192');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Curaçao', 'CW', 'CUW', '531');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Cyprus', 'CY', 'CYP', '196');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Czechia', 'CZ', 'CZE', '203');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Denmark', 'DK', 'DNK', '208');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Djibouti', 'DJ', 'DJI', '262');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Dominica', 'DM', 'DMA', '212');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Dominican Republic (the)', 'DO', 'DOM', '214');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Ecuador', 'EC', 'ECU', '218');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Egypt', 'EG', 'EGY', '818');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('El Salvador', 'SV', 'SLV', '222');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Equatorial Guinea', 'GQ', 'GNQ', '226');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Eritrea', 'ER', 'ERI', '232');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Estonia', 'EE', 'EST', '233');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Eswatini', 'SZ', 'SWZ', '748');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Ethiopia', 'ET', 'ETH', '231');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Falkland Islands (the) [Malvinas]', 'FK', 'FLK', '238');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Faroe Islands (the)', 'FO', 'FRO', '234');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Fiji', 'FJ', 'FJI', '242');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Finland', 'FI', 'FIN', '246');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('France', 'FR', 'FRA', '250');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('French Guiana', 'GF', 'GUF', '254');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('French Polynesia', 'PF', 'PYF', '258');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('French Southern Territories (the)', 'TF', 'ATF', '260');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Gabon', 'GA', 'GAB', '266');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Gambia (the)', 'GM', 'GMB', '270');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Georgia', 'GE', 'GEO', '268');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Germany', 'DE', 'DEU', '276');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Ghana', 'GH', 'GHA', '288');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Gibraltar', 'GI', 'GIB', '292');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Greece', 'GR', 'GRC', '300');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Greenland', 'GL', 'GRL', '304');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Grenada', 'GD', 'GRD', '308');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Guadeloupe', 'GP', 'GLP', '312');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Guam', 'GU', 'GUM', '316');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Guatemala', 'GT', 'GTM', '320');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Guernsey', 'GG', 'GGY', '831');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Guinea', 'GN', 'GIN', '324');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Guinea-Bissau', 'GW', 'GNB', '624');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Guyana', 'GY', 'GUY', '328');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Haiti', 'HT', 'HTI', '332');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Heard Island and McDonald Islands', 'HM', 'HMD', '334');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Holy See (the)', 'VA', 'VAT', '336');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Honduras', 'HN', 'HND', '340');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Hong Kong', 'HK', 'HKG', '344');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Hungary', 'HU', 'HUN', '348');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Iceland', 'IS', 'ISL', '352');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('India', 'IN', 'IND', '356');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Indonesia', 'ID', 'IDN', '360');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Iran (Islamic Republic of)', 'IR', 'IRN', '364');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Iraq', 'IQ', 'IRQ', '368');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Ireland', 'IE', 'IRL', '372');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Isle of Man', 'IM', 'IMN', '833');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Israel', 'IL', 'ISR', '376');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Italy', 'IT', 'ITA', '380');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Jamaica', 'JM', 'JAM', '388');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Japan', 'JP', 'JPN', '392');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Jersey', 'JE', 'JEY', '832');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Jordan', 'JO', 'JOR', '400');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Kazakhstan', 'KZ', 'KAZ', '398');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Kenya', 'KE', 'KEN', '404');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Kiribati', 'KI', 'KIR', '296');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Korea (the Democratic People s Republic of)', 'KP', 'PRK', '408');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Korea (the Republic of)', 'KR', 'KOR', '410');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Kuwait', 'KW', 'KWT', '414');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Kyrgyzstan', 'KG', 'KGZ', '417');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Lao People s Democratic Republic (the)', 'LA', 'LAO', '418');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Latvia', 'LV', 'LVA', '428');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Lebanon', 'LB', 'LBN', '422');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Lesotho', 'LS', 'LSO', '426');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Liberia', 'LR', 'LBR', '430');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Libya', 'LY', 'LBY', '434');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Liechtenstein', 'LI', 'LIE', '438');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Lithuania', 'LT', 'LTU', '440');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Luxembourg', 'LU', 'LUX', '442');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Macao', 'MO', 'MAC', '446');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Madagascar', 'MG', 'MDG', '450');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Malawi', 'MW', 'MWI', '454');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Malaysia', 'MY', 'MYS', '458');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Maldives', 'MV', 'MDV', '462');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Mali', 'ML', 'MLI', '466');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Malta', 'MT', 'MLT', '470');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Marshall Islands (the)', 'MH', 'MHL', '584');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Martinique', 'MQ', 'MTQ', '474');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Mauritania', 'MR', 'MRT', '478');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Mauritius', 'MU', 'MUS', '480');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Mayotte', 'YT', 'MYT', '175');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Mexico', 'MX', 'MEX', '484');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Micronesia (Federated States of)', 'FM', 'FSM', '583');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Moldova (the Republic of)', 'MD', 'MDA', '498');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Monaco', 'MC', 'MCO', '492');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Mongolia', 'MN', 'MNG', '496');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Montenegro', 'ME', 'MNE', '499');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Montserrat', 'MS', 'MSR', '500');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Morocco', 'MA', 'MAR', '504');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Mozambique', 'MZ', 'MOZ', '508');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Myanmar', 'MM', 'MMR', '104');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Namibia', 'NA', 'NAM', '516');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Nauru', 'NR', 'NRU', '520');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Nepal', 'NP', 'NPL', '524');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Netherlands (the)', 'NL', 'NLD', '528');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('New Caledonia', 'NC', 'NCL', '540');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('New Zealand', 'NZ', 'NZL', '554');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Nicaragua', 'NI', 'NIC', '558');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Niger (the)', 'NE', 'NER', '562');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Nigeria', 'NG', 'NGA', '566');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Niue', 'NU', 'NIU', '570');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Norfolk Island', 'NF', 'NFK', '574');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Northern Mariana Islands (the)', 'MP', 'MNP', '580');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Norway', 'NO', 'NOR', '578');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Oman', 'OM', 'OMN', '512');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Pakistan', 'PK', 'PAK', '586');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Palau', 'PW', 'PLW', '585');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Palestine, State of', 'PS', 'PSE', '275');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Panama', 'PA', 'PAN', '591');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Papua New Guinea', 'PG', 'PNG', '598');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Paraguay', 'PY', 'PRY', '600');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Peru', 'PE', 'PER', '604');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Philippines (the)', 'PH', 'PHL', '608');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Pitcairn', 'PN', 'PCN', '612');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Poland', 'PL', 'POL', '616');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Portugal', 'PT', 'PRT', '620');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Puerto Rico', 'PR', 'PRI', '630');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Qatar', 'QA', 'QAT', '634');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Republic of North Macedonia', 'MK', 'MKD', '807');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Romania', 'RO', 'ROU', '642');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Russian Federation (the)', 'RU', 'RUS', '643');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Rwanda', 'RW', 'RWA', '646');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Réunion', 'RE', 'REU', '638');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Saint Barthélemy', 'BL', 'BLM', '652');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', '654');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Saint Kitts and Nevis', 'KN', 'KNA', '659');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Saint Lucia', 'LC', 'LCA', '662');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Saint Martin (French part)', 'MF', 'MAF', '663');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Saint Pierre and Miquelon', 'PM', 'SPM', '666');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Saint Vincent and the Grenadines', 'VC', 'VCT', '670');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Samoa', 'WS', 'WSM', '882');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('San Marino', 'SM', 'SMR', '674');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Sao Tome and Principe', 'ST', 'STP', '678');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Saudi Arabia', 'SA', 'SAU', '682');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Senegal', 'SN', 'SEN', '686');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Serbia', 'RS', 'SRB', '688');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Seychelles', 'SC', 'SYC', '690');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Sierra Leone', 'SL', 'SLE', '694');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Singapore', 'SG', 'SGP', '702');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Sint Maarten (Dutch part)', 'SX', 'SXM', '534');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Slovakia', 'SK', 'SVK', '703');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Slovenia', 'SI', 'SVN', '705');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Solomon Islands', 'SB', 'SLB', '090');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Somalia', 'SO', 'SOM', '706');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('South Africa', 'ZA', 'ZAF', '710');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('South Georgia and the South Sandwich Islands', 'GS', 'SGS', '239');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('South Sudan', 'SS', 'SSD', '728');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Spain', 'ES', 'ESP', '724');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Sri Lanka', 'LK', 'LKA', '144');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Sudan (the)', 'SD', 'SDN', '729');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Suriname', 'SR', 'SUR', '740');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Svalbard and Jan Mayen', 'SJ', 'SJM', '744');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Sweden', 'SE', 'SWE', '752');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Switzerland', 'CH', 'CHE', '756');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Syrian Arab Republic', 'SY', 'SYR', '760');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Taiwan (Province of China)', 'TW', 'TWN', '158');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Tajikistan', 'TJ', 'TJK', '762');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Tanzania, United Republic of', 'TZ', 'TZA', '834');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Thailand', 'TH', 'THA', '764');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Timor-Leste', 'TL', 'TLS', '626');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Togo', 'TG', 'TGO', '768');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Tokelau', 'TK', 'TKL', '772');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Tonga', 'TO', 'TON', '776');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Trinidad and Tobago', 'TT', 'TTO', '780');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Tunisia', 'TN', 'TUN', '788');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Turkey', 'TR', 'TUR', '792');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Turkmenistan', 'TM', 'TKM', '795');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Turks and Caicos Islands (the)', 'TC', 'TCA', '796');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Tuvalu', 'TV', 'TUV', '798');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Uganda', 'UG', 'UGA', '800');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Ukraine', 'UA', 'UKR', '804');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('United Arab Emirates (the)', 'AE', 'ARE', '784');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('United Kingdom of Great Britain and Northern Ireland (the)', 'GB', 'GBR', '826');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('United States Minor Outlying Islands (the)', 'UM', 'UMI', '581');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('United States of America (the)', 'US', 'USA', '840');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Uruguay', 'UY', 'URY', '858');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Uzbekistan', 'UZ', 'UZB', '860');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Vanuatu', 'VU', 'VUT', '548');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Venezuela (Bolivarian Republic of)', 'VE', 'VEN', '862');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Viet Nam', 'VN', 'VNM', '704');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Virgin Islands (British)', 'VG', 'VGB', '092');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Virgin Islands (U.S.)', 'VI', 'VIR', '850');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Wallis and Futuna', 'WF', 'WLF', '876');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Western Sahara', 'EH', 'ESH', '732');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Yemen', 'YE', 'YEM', '887');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Zambia', 'ZM', 'ZMB', '894');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Zimbabwe', 'ZW', 'ZWE', '716');
INSERT INTO recruitment.nationality (description, iso_2, iso_3, code) VALUES ('Åland Islands', 'AX', 'ALA', '248');

-- Auto-generated SQL script #202505272236
INSERT INTO recruitment.job_profile_level ("level",description)
	VALUES ('NIVEL A','Profesor titular');
INSERT INTO recruitment.job_profile_level ("level",description)
	VALUES ('NIVEL B','Profesor asociado');
INSERT INTO recruitment.job_profile_level ("level",description)
	VALUES ('NIVEL C','Profesor adjunto');
INSERT INTO recruitment.job_profile_level ("level",description)
	VALUES ('NIVEL D1','Asistente principal');
INSERT INTO recruitment.job_profile_level ("level",description)
	VALUES ('NIVEL D2','Asistente de primera');
	
INSERT INTO recruitment.requirement_target_comparator (id,name,description) VALUES
     (1,'PERSONAL_DATA','Datos personales'),
     (2,'EXPERIENCE_DATA','Experiencia laboral'),
     (3,'EDUCATION_DATA','Educación '),
     (4,'TECHNICAL_SKILL_DATA','Habilidades técnicas'),
     (5,'CERTIFICATION_DATA','Certificaciones'),
     (6,'LANGUAGE_DATA','Idiomas');
	 
INSERT INTO recruitment.identification_type (id,code,description) VALUES
	 (1,'DNI','Documento nacional de identidad');


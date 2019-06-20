SET xmloption = content;
CREATE TABLE public."Activity" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    note text,
    "leadId" uuid,
    type text DEFAULT 'note'::text,
    "createdAt" timestamp with time zone DEFAULT now(),
    data jsonb,
    "ownerId" uuid,
    notify boolean DEFAULT true,
    date date DEFAULT now(),
    "time" time without time zone DEFAULT now()
);
CREATE TABLE public."Address" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "buildingName" text,
    floor text,
    number integer,
    street text,
    city text,
    khan text,
    sangkat text,
    lat numeric,
    long numeric,
    "leadId" uuid DEFAULT public.gen_random_uuid(),
    lng numeric,
    "postCode" text
);
CREATE TABLE public."DecisionMaker" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    title text,
    "firstName" text,
    "lastName" text,
    "position" text,
    phone text,
    email text,
    "leadId" uuid,
    "createdAt" timestamp with time zone DEFAULT now(),
    "countryCode" text,
    "companyId" uuid
);
CREATE TABLE public."Group" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    "leadId" uuid
);
CREATE TABLE public."Lead" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    phone text,
    email text,
    "isAffliated" boolean DEFAULT false,
    "employeesNumber" text,
    outlets integer,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now(),
    sector text,
    type text,
    logo text,
    "ownerId" uuid,
    status text DEFAULT 'Unqualified'::text NOT NULL,
    size text,
    "teamId" uuid,
    stats boolean DEFAULT true,
    "groupId" uuid,
    "referenceId" text,
    "countryCode" text
);
CREATE TABLE public."LoyaltyProgram" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "leadId" uuid,
    type text,
    "like" boolean DEFAULT false,
    comment text
);
CREATE TABLE public."PaymentPlatform" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "leadId" uuid,
    type text,
    "like" boolean DEFAULT false,
    comment text
);
CREATE TABLE public."PaymentTerminal" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    comment text,
    "leadId" uuid,
    type text DEFAULT 'false'::text,
    "like" boolean DEFAULT false
);
CREATE TABLE public."Photo" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    url text,
    name text DEFAULT 'Angela'::text,
    description text,
    type text DEFAULT 'owner photo'::text,
    "leadId" uuid NOT NULL
);
CREATE TABLE public."Pos" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "leadId" uuid,
    comment text,
    "like" boolean DEFAULT false,
    type text
);
CREATE TABLE public."Region" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    "managerId" uuid NOT NULL
);
CREATE TABLE public."Revenue" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    duration text,
    amount text,
    "leadId" uuid DEFAULT public.gen_random_uuid()
);
CREATE TABLE public."Social" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "leadId" uuid NOT NULL,
    type text,
    link text
);
CREATE TABLE public."Website" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    url text,
    type text,
    "leadId" uuid NOT NULL
);
CREATE TABLE public."Company" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL
);
CREATE TABLE public."Score" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "all" integer NOT NULL,
    info integer NOT NULL,
    payment integer NOT NULL,
    contact integer NOT NULL,
    type integer NOT NULL,
    "leadId" uuid DEFAULT public.gen_random_uuid() NOT NULL
);
CREATE TABLE public."Enum" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    description text
);
CREATE TABLE public."Credential" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "phoneNumber" text NOT NULL,
    pin text,
    "userId" uuid
);
CREATE TABLE public."Notification" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now(),
    message text,
    data jsonb,
    title text,
    invisible boolean DEFAULT false
);
CREATE TABLE public."Roles" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    role text NOT NULL
);
CREATE TABLE public."Session" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    token uuid,
    "credentialId" uuid
);
CREATE TABLE public."Team" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    "managerId" uuid NOT NULL,
    "associateIds" jsonb,
    "createdAt" timestamp with time zone DEFAULT now(),
    "regionId" uuid
);
CREATE TABLE public."TeamAndMembers" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "teamId" uuid NOT NULL,
    "userId" uuid NOT NULL
);
CREATE TABLE public."Users" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    role text NOT NULL,
    photo text,
    "countryCode" text
);
ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_leadId_key" UNIQUE ("leadId");
ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Credential"
    ADD CONSTRAINT "Credential_phoneNumber_key" UNIQUE ("phoneNumber");
ALTER TABLE ONLY public."Credential"
    ADD CONSTRAINT "Credential_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Credential"
    ADD CONSTRAINT "Credential_userId_key" UNIQUE ("userId");
ALTER TABLE ONLY public."DecisionMaker"
    ADD CONSTRAINT "DecisionMaker_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Enum"
    ADD CONSTRAINT "Enum_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_name_key" UNIQUE (name);
ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Lead"
    ADD CONSTRAINT "Lead_name_key" UNIQUE (name);
ALTER TABLE ONLY public."Lead"
    ADD CONSTRAINT "Lead_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."LoyaltyProgram"
    ADD CONSTRAINT "LoyaltyProgram_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."PaymentPlatform"
    ADD CONSTRAINT "PaymentPlatform_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."PaymentTerminal"
    ADD CONSTRAINT "PaymentTerminal_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Photo"
    ADD CONSTRAINT "Photo_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Photo"
    ADD CONSTRAINT "Photo_url_key" UNIQUE (url);
ALTER TABLE ONLY public."Pos"
    ADD CONSTRAINT "Pos_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_name_key" UNIQUE (name);
ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Revenue"
    ADD CONSTRAINT "Revenue_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_role_key" UNIQUE (role);
ALTER TABLE ONLY public."Score"
    ADD CONSTRAINT "Score_leadId_key" UNIQUE ("leadId");
ALTER TABLE ONLY public."Score"
    ADD CONSTRAINT "Score_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Social"
    ADD CONSTRAINT "Social_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."TeamAndMembers"
    ADD CONSTRAINT "TeamAndMembers_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Team"
    ADD CONSTRAINT "Team_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Website"
    ADD CONSTRAINT "Website_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT company_name_key UNIQUE (name);
ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES public."Users"(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."Credential"
    ADD CONSTRAINT "Credential_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."DecisionMaker"
    ADD CONSTRAINT "DecisionMaker_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public."Company"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."DecisionMaker"
    ADD CONSTRAINT "DecisionMaker_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES public."Lead"(id);
ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_parentId_fkey" FOREIGN KEY ("leadId") REFERENCES public."Lead"(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."Lead"
    ADD CONSTRAINT "Lead_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public."Group"(id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE ONLY public."Photo"
    ADD CONSTRAINT "Photo_leadId_fkey1" FOREIGN KEY ("leadId") REFERENCES public."Lead"(id);
ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_managerId_fkey" FOREIGN KEY ("managerId") REFERENCES public."Users"(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_credentialId_fkey" FOREIGN KEY ("credentialId") REFERENCES public."Credential"(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."Social"
    ADD CONSTRAINT "Social_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES public."Lead"(id);
ALTER TABLE ONLY public."Team"
    ADD CONSTRAINT "Team_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES public."Region"(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_role_fkey" FOREIGN KEY (role) REFERENCES public."Roles"(role);

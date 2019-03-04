create sequence hibernate_sequence start 1 increment 1

    create table AgeCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxAge int4 not null,
        minAge int4 not null,
        primary key (id)
    )

    create table Exercise (
       name varchar(255) not null,
        maxLoad float8 not null,
        maxReps int4 not null,
        primary key (name)
    )

    create table Gender (
       sexName varchar(255) not null,
        primary key (sexName)
    )

    create table LoginData (
       id int4 not null,
        password varchar(255) not null,
        primary key (id)
    )

    create table PersonalBest (
       id int4 not null,
        date timestamp not null,
        rMax1 int4 not null,
        rMax10 int4 not null,
        ageCategory_id int4,
        exercise_name varchar(255),
        user_id int4,
        weightCategory_id int4,
        primary key (id)
    )

    create table Session (
       id int4 not null,
        sessionId varchar(255) not null,
        userLogin_id int4,
        primary key (id)
    )

    create table SetScheme (
       id int4 not null,
        load float8 not null,
        reps int4 not null,
        primary key (id)
    )

    create table Training (
       id int4 not null,
        trainingDate date not null,
        exercise_name varchar(255),
        set_id int4,
        primary key (id)
    )

    create table User (
       id int4 not null,
        age int4 not null,
        nickname varchar(255),
        weight int4 not null,
        ageCategory_id int4,
        login_id int4,
        sex_sexName varchar(255),
        weightCategory_id int4,
        primary key (id)
    )

    create table UserTraining (
       id int4 not null,
        trainingId_id int4,
        userLogin_id int4,
        primary key (id)
    )

    create table WeightCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxWeight int4 not null,
        minWeight int4 not null,
        primary key (id)
    )
create index IDXpba1s6m77ws99teh501b9snsr on Training (trainingDate)
create index IDXcdd273rg61diywe30f4k0t5mo on User (nickname)

    alter table PersonalBest 
       add constraint FKl4fvuu9c1ocwdt10ocfpwjos0 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table PersonalBest 
       add constraint FKdylt0yvvelanmrb7n3riaxysg 
       foreign key (exercise_name) 
       references Exercise

    alter table PersonalBest 
       add constraint FK5tcpop67pvkad7e5a3vvpyemp 
       foreign key (user_id) 
       references User

    alter table PersonalBest 
       add constraint FKc2o75jtyjclhlt0qynnkf6wgw 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table Session 
       add constraint FKq50xvq6kdpsflie9k6f7qrvpb 
       foreign key (userLogin_id) 
       references User

    alter table Training 
       add constraint FKhlhq2h388nx99tngpuxdch3e7 
       foreign key (exercise_name) 
       references Exercise

    alter table Training 
       add constraint FKmedjs0jpx6p5hev1d6ajh98kd 
       foreign key (set_id) 
       references SetScheme

    alter table User 
       add constraint FK3ci0w5c5d2lwgkdywoeutkfhd 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table User 
       add constraint FKbt135luf8gwi0qa007kdjd962 
       foreign key (login_id) 
       references LoginData

    alter table User 
       add constraint FKiqn7m4itx17rxq85ncyxpguyk 
       foreign key (sex_sexName) 
       references Gender

    alter table User 
       add constraint FKg2sb7scuxryfyswfoyggfj4bk 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table UserTraining 
       add constraint FKa9h1qnht5ucr0ajfa9nkgp8bg 
       foreign key (trainingId_id) 
       references Training

    alter table UserTraining 
       add constraint FKsewm36ihtyp612trse2bqxtjh 
       foreign key (userLogin_id) 
       references User
create sequence hibernate_sequence start 1 increment 1

    create table AgeCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxAge int4 not null,
        minAge int4 not null,
        primary key (id)
    )

    create table Exercise (
       name varchar(255) not null,
        maxLoad float8 not null,
        maxReps int4 not null,
        primary key (name)
    )

    create table Gender (
       sexName varchar(255) not null,
        primary key (sexName)
    )

    create table LoginData (
       id int4 not null,
        password varchar(255) not null,
        primary key (id)
    )

    create table PersonalBest (
       id int4 not null,
        date timestamp not null,
        rMax1 int4 not null,
        rMax10 int4 not null,
        ageCategory_id int4,
        exercise_name varchar(255),
        user_id int4,
        weightCategory_id int4,
        primary key (id)
    )

    create table Session (
       id int4 not null,
        sessionId varchar(255) not null,
        userLogin_id int4,
        primary key (id)
    )

    create table SetScheme (
       id int4 not null,
        load float8 not null,
        reps int4 not null,
        primary key (id)
    )

    create table Training (
       id int4 not null,
        trainingDate date not null,
        exercise_name varchar(255),
        set_id int4,
        primary key (id)
    )

    create table User (
       id int4 not null,
        age int4 not null,
        nickname varchar(255),
        weight int4 not null,
        ageCategory_id int4,
        login_id int4,
        sex_sexName varchar(255),
        weightCategory_id int4,
        primary key (id)
    )

    create table UserTraining (
       id int4 not null,
        trainingId_id int4,
        userLogin_id int4,
        primary key (id)
    )

    create table WeightCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxWeight int4 not null,
        minWeight int4 not null,
        primary key (id)
    )
create index IDXpba1s6m77ws99teh501b9snsr on Training (trainingDate)
create index IDXcdd273rg61diywe30f4k0t5mo on User (nickname)

    alter table PersonalBest 
       add constraint FKl4fvuu9c1ocwdt10ocfpwjos0 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table PersonalBest 
       add constraint FKdylt0yvvelanmrb7n3riaxysg 
       foreign key (exercise_name) 
       references Exercise

    alter table PersonalBest 
       add constraint FK5tcpop67pvkad7e5a3vvpyemp 
       foreign key (user_id) 
       references User

    alter table PersonalBest 
       add constraint FKc2o75jtyjclhlt0qynnkf6wgw 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table Session 
       add constraint FKq50xvq6kdpsflie9k6f7qrvpb 
       foreign key (userLogin_id) 
       references User

    alter table Training 
       add constraint FKhlhq2h388nx99tngpuxdch3e7 
       foreign key (exercise_name) 
       references Exercise

    alter table Training 
       add constraint FKmedjs0jpx6p5hev1d6ajh98kd 
       foreign key (set_id) 
       references SetScheme

    alter table User 
       add constraint FK3ci0w5c5d2lwgkdywoeutkfhd 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table User 
       add constraint FKbt135luf8gwi0qa007kdjd962 
       foreign key (login_id) 
       references LoginData

    alter table User 
       add constraint FKiqn7m4itx17rxq85ncyxpguyk 
       foreign key (sex_sexName) 
       references Gender

    alter table User 
       add constraint FKg2sb7scuxryfyswfoyggfj4bk 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table UserTraining 
       add constraint FKa9h1qnht5ucr0ajfa9nkgp8bg 
       foreign key (trainingId_id) 
       references Training

    alter table UserTraining 
       add constraint FKsewm36ihtyp612trse2bqxtjh 
       foreign key (userLogin_id) 
       references User
create sequence hibernate_sequence start 1 increment 1

    create table AgeCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxAge int4 not null,
        minAge int4 not null,
        primary key (id)
    )

    create table Exercise (
       name varchar(255) not null,
        maxLoad float8 not null,
        maxReps int4 not null,
        primary key (name)
    )

    create table Gender (
       sexName varchar(255) not null,
        primary key (sexName)
    )

    create table LoginData (
       id int4 not null,
        password varchar(255) not null,
        primary key (id)
    )

    create table PersonalBest (
       id int4 not null,
        date timestamp not null,
        rMax1 int4 not null,
        rMax10 int4 not null,
        ageCategory_id int4,
        exercise_name varchar(255),
        user_id int4,
        weightCategory_id int4,
        primary key (id)
    )

    create table Session (
       id int4 not null,
        sessionId varchar(255) not null,
        userLogin_id int4,
        primary key (id)
    )

    create table SetScheme (
       id int4 not null,
        load float8 not null,
        reps int4 not null,
        primary key (id)
    )

    create table Training (
       id int4 not null,
        trainingDate date not null,
        exercise_name varchar(255),
        set_id int4,
        primary key (id)
    )

    create table User (
       id int4 not null,
        age int4 not null,
        nickname varchar(255),
        weight int4 not null,
        ageCategory_id int4,
        login_id int4,
        sex_sexName varchar(255),
        weightCategory_id int4,
        primary key (id)
    )

    create table UserTraining (
       id int4 not null,
        trainingId_id int4,
        userLogin_id int4,
        primary key (id)
    )

    create table WeightCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxWeight int4 not null,
        minWeight int4 not null,
        primary key (id)
    )
create index IDXpba1s6m77ws99teh501b9snsr on Training (trainingDate)
create index IDXcdd273rg61diywe30f4k0t5mo on User (nickname)

    alter table PersonalBest 
       add constraint FKl4fvuu9c1ocwdt10ocfpwjos0 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table PersonalBest 
       add constraint FKdylt0yvvelanmrb7n3riaxysg 
       foreign key (exercise_name) 
       references Exercise

    alter table PersonalBest 
       add constraint FK5tcpop67pvkad7e5a3vvpyemp 
       foreign key (user_id) 
       references User

    alter table PersonalBest 
       add constraint FKc2o75jtyjclhlt0qynnkf6wgw 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table Session 
       add constraint FKq50xvq6kdpsflie9k6f7qrvpb 
       foreign key (userLogin_id) 
       references User

    alter table Training 
       add constraint FKhlhq2h388nx99tngpuxdch3e7 
       foreign key (exercise_name) 
       references Exercise

    alter table Training 
       add constraint FKmedjs0jpx6p5hev1d6ajh98kd 
       foreign key (set_id) 
       references SetScheme

    alter table User 
       add constraint FK3ci0w5c5d2lwgkdywoeutkfhd 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table User 
       add constraint FKbt135luf8gwi0qa007kdjd962 
       foreign key (login_id) 
       references LoginData

    alter table User 
       add constraint FKiqn7m4itx17rxq85ncyxpguyk 
       foreign key (sex_sexName) 
       references Gender

    alter table User 
       add constraint FKg2sb7scuxryfyswfoyggfj4bk 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table UserTraining 
       add constraint FKa9h1qnht5ucr0ajfa9nkgp8bg 
       foreign key (trainingId_id) 
       references Training

    alter table UserTraining 
       add constraint FKsewm36ihtyp612trse2bqxtjh 
       foreign key (userLogin_id) 
       references User
create sequence hibernate_sequence start 1 increment 1

    create table AgeCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxAge int4 not null,
        minAge int4 not null,
        primary key (id)
    )

    create table Exercise (
       name varchar(255) not null,
        maxLoad float8 not null,
        maxReps int4 not null,
        primary key (name)
    )

    create table Gender (
       sexName varchar(255) not null,
        primary key (sexName)
    )

    create table LoginData (
       id int4 not null,
        password varchar(255) not null,
        login_id int4,
        primary key (id)
    )

    create table PersonalBest (
       id int4 not null,
        date timestamp not null,
        rMax1 int4 not null,
        rMax10 int4 not null,
        ageCategory_id int4,
        exercise_name varchar(255),
        user_id int4,
        weightCategory_id int4,
        primary key (id)
    )

    create table Session (
       id int4 not null,
        sessionId varchar(255) not null,
        userLogin_id int4,
        primary key (id)
    )

    create table SetScheme (
       id int4 not null,
        load float8 not null,
        reps int4 not null,
        primary key (id)
    )

    create table Training (
       id int4 not null,
        trainingDate date not null,
        exercise_name varchar(255),
        set_id int4,
        primary key (id)
    )

    create table User (
       id int4 not null,
        age int4 not null,
        nickname varchar(255),
        weight int4 not null,
        ageCategory_id int4,
        login_id int4,
        sex_sexName varchar(255),
        weightCategory_id int4,
        primary key (id)
    )

    create table UserTraining (
       id int4 not null,
        trainingId_id int4,
        userLogin_id int4,
        primary key (id)
    )

    create table WeightCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxWeight int4 not null,
        minWeight int4 not null,
        primary key (id)
    )
create index IDXpba1s6m77ws99teh501b9snsr on Training (trainingDate)
create index IDXcdd273rg61diywe30f4k0t5mo on User (nickname)

    alter table LoginData 
       add constraint FK3y817r6v3q216ywwwnr2uo7w0 
       foreign key (login_id) 
       references User

    alter table PersonalBest 
       add constraint FKl4fvuu9c1ocwdt10ocfpwjos0 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table PersonalBest 
       add constraint FKdylt0yvvelanmrb7n3riaxysg 
       foreign key (exercise_name) 
       references Exercise

    alter table PersonalBest 
       add constraint FK5tcpop67pvkad7e5a3vvpyemp 
       foreign key (user_id) 
       references User

    alter table PersonalBest 
       add constraint FKc2o75jtyjclhlt0qynnkf6wgw 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table Session 
       add constraint FKq50xvq6kdpsflie9k6f7qrvpb 
       foreign key (userLogin_id) 
       references User

    alter table Training 
       add constraint FKhlhq2h388nx99tngpuxdch3e7 
       foreign key (exercise_name) 
       references Exercise

    alter table Training 
       add constraint FKmedjs0jpx6p5hev1d6ajh98kd 
       foreign key (set_id) 
       references SetScheme

    alter table User 
       add constraint FK3ci0w5c5d2lwgkdywoeutkfhd 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table User 
       add constraint FKbt135luf8gwi0qa007kdjd962 
       foreign key (login_id) 
       references LoginData

    alter table User 
       add constraint FKiqn7m4itx17rxq85ncyxpguyk 
       foreign key (sex_sexName) 
       references Gender

    alter table User 
       add constraint FKg2sb7scuxryfyswfoyggfj4bk 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table UserTraining 
       add constraint FKa9h1qnht5ucr0ajfa9nkgp8bg 
       foreign key (trainingId_id) 
       references Training

    alter table UserTraining 
       add constraint FKsewm36ihtyp612trse2bqxtjh 
       foreign key (userLogin_id) 
       references User
create sequence hibernate_sequence start 1 increment 1

    create table AgeCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxAge int4 not null,
        minAge int4 not null,
        primary key (id)
    )

    create table Exercise (
       name varchar(255) not null,
        maxLoad float8 not null,
        maxReps int4 not null,
        primary key (name)
    )

    create table Gender (
       sexName varchar(255) not null,
        primary key (sexName)
    )

    create table LoginData (
       id int4 not null,
        password varchar(255) not null,
        login_id int4,
        primary key (id)
    )

    create table PersonalBest (
       id int4 not null,
        date timestamp not null,
        rMax1 int4 not null,
        rMax10 int4 not null,
        ageCategory_id int4,
        exercise_name varchar(255),
        user_id int4,
        weightCategory_id int4,
        primary key (id)
    )

    create table Session (
       id int4 not null,
        sessionId varchar(255) not null,
        userLogin_id int4,
        primary key (id)
    )

    create table SetScheme (
       id int4 not null,
        load float8 not null,
        reps int4 not null,
        primary key (id)
    )

    create table Training (
       id int4 not null,
        trainingDate date not null,
        exercise_name varchar(255),
        set_id int4,
        primary key (id)
    )

    create table User (
       id int4 not null,
        age int4 not null,
        nickname varchar(255),
        weight int4 not null,
        ageCategory_id int4,
        login_id int4,
        sex_sexName varchar(255),
        weightCategory_id int4,
        primary key (id)
    )

    create table UserTraining (
       id int4 not null,
        trainingId_id int4,
        userLogin_id int4,
        primary key (id)
    )

    create table WeightCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxWeight int4 not null,
        minWeight int4 not null,
        primary key (id)
    )

    alter table LoginData 
       add constraint FK3y817r6v3q216ywwwnr2uo7w0 
       foreign key (login_id) 
       references User

    alter table PersonalBest 
       add constraint FKl4fvuu9c1ocwdt10ocfpwjos0 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table PersonalBest 
       add constraint FKdylt0yvvelanmrb7n3riaxysg 
       foreign key (exercise_name) 
       references Exercise

    alter table PersonalBest 
       add constraint FK5tcpop67pvkad7e5a3vvpyemp 
       foreign key (user_id) 
       references User

    alter table PersonalBest 
       add constraint FKc2o75jtyjclhlt0qynnkf6wgw 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table Session 
       add constraint FKq50xvq6kdpsflie9k6f7qrvpb 
       foreign key (userLogin_id) 
       references User

    alter table Training 
       add constraint FKhlhq2h388nx99tngpuxdch3e7 
       foreign key (exercise_name) 
       references Exercise

    alter table Training 
       add constraint FKmedjs0jpx6p5hev1d6ajh98kd 
       foreign key (set_id) 
       references SetScheme

    alter table User 
       add constraint FK3ci0w5c5d2lwgkdywoeutkfhd 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table User 
       add constraint FKbt135luf8gwi0qa007kdjd962 
       foreign key (login_id) 
       references LoginData

    alter table User 
       add constraint FKiqn7m4itx17rxq85ncyxpguyk 
       foreign key (sex_sexName) 
       references Gender

    alter table User 
       add constraint FKg2sb7scuxryfyswfoyggfj4bk 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table UserTraining 
       add constraint FKa9h1qnht5ucr0ajfa9nkgp8bg 
       foreign key (trainingId_id) 
       references Training

    alter table UserTraining 
       add constraint FKsewm36ihtyp612trse2bqxtjh 
       foreign key (userLogin_id) 
       references User
create sequence hibernate_sequence start 1 increment 1

    create table AgeCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxAge int4 not null,
        minAge int4 not null,
        primary key (id)
    )

    create table Exercise (
       name varchar(255) not null,
        maxLoad float8 not null,
        maxReps int4 not null,
        primary key (name)
    )

    create table Gender (
       sexName varchar(255) not null,
        primary key (sexName)
    )

    create table LoginData (
       id int4 not null,
        password varchar(255) not null,
        login_id int4,
        primary key (id)
    )

    create table PersonalBest (
       id int4 not null,
        date timestamp not null,
        rMax1 int4 not null,
        rMax10 int4 not null,
        ageCategory_id int4,
        exercise_name varchar(255),
        user_id int4,
        weightCategory_id int4,
        primary key (id)
    )

    create table Session (
       id int4 not null,
        sessionId varchar(255) not null,
        userLogin_id int4,
        primary key (id)
    )

    create table SetScheme (
       id int4 not null,
        load float8 not null,
        reps int4 not null,
        primary key (id)
    )

    create table Training (
       id int4 not null,
        trainingDate date not null,
        exercise_name varchar(255),
        set_id int4,
        primary key (id)
    )

    create table User (
       id int4 not null,
        age int4 not null,
        login varchar(255),
        nickname varchar(255),
        weight int4 not null,
        ageCategory_id int4,
        sex_sexName varchar(255),
        weightCategory_id int4,
        primary key (id)
    )

    create table UserTraining (
       id int4 not null,
        trainingId_id int4,
        userLogin_id int4,
        primary key (id)
    )

    create table WeightCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxWeight int4 not null,
        minWeight int4 not null,
        primary key (id)
    )

    alter table LoginData 
       add constraint FK3y817r6v3q216ywwwnr2uo7w0 
       foreign key (login_id) 
       references User

    alter table PersonalBest 
       add constraint FKl4fvuu9c1ocwdt10ocfpwjos0 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table PersonalBest 
       add constraint FKdylt0yvvelanmrb7n3riaxysg 
       foreign key (exercise_name) 
       references Exercise

    alter table PersonalBest 
       add constraint FK5tcpop67pvkad7e5a3vvpyemp 
       foreign key (user_id) 
       references User

    alter table PersonalBest 
       add constraint FKc2o75jtyjclhlt0qynnkf6wgw 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table Session 
       add constraint FKq50xvq6kdpsflie9k6f7qrvpb 
       foreign key (userLogin_id) 
       references User

    alter table Training 
       add constraint FKhlhq2h388nx99tngpuxdch3e7 
       foreign key (exercise_name) 
       references Exercise

    alter table Training 
       add constraint FKmedjs0jpx6p5hev1d6ajh98kd 
       foreign key (set_id) 
       references SetScheme

    alter table User 
       add constraint FK3ci0w5c5d2lwgkdywoeutkfhd 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table User 
       add constraint FKiqn7m4itx17rxq85ncyxpguyk 
       foreign key (sex_sexName) 
       references Gender

    alter table User 
       add constraint FKg2sb7scuxryfyswfoyggfj4bk 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table UserTraining 
       add constraint FKa9h1qnht5ucr0ajfa9nkgp8bg 
       foreign key (trainingId_id) 
       references Training

    alter table UserTraining 
       add constraint FKsewm36ihtyp612trse2bqxtjh 
       foreign key (userLogin_id) 
       references User
create sequence hibernate_sequence start 1 increment 1

    create table AgeCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxAge int4 not null,
        minAge int4 not null,
        primary key (id)
    )

    create table Exercise (
       name varchar(255) not null,
        maxLoad float8 not null,
        maxReps int4 not null,
        primary key (name)
    )

    create table Gender (
       sexName varchar(255) not null,
        primary key (sexName)
    )

    create table GymUser (
       id int4 not null,
        age int4 not null,
        login varchar(255),
        nickname varchar(255),
        weight int4 not null,
        ageCategory_id int4,
        sex_sexName varchar(255),
        weightCategory_id int4,
        primary key (id)
    )

    create table LoginData (
       id int4 not null,
        password varchar(255) not null,
        login_id int4,
        primary key (id)
    )

    create table PersonalBest (
       id int4 not null,
        date timestamp not null,
        rMax1 int4 not null,
        rMax10 int4 not null,
        ageCategory_id int4,
        exercise_name varchar(255),
        user_id int4,
        weightCategory_id int4,
        primary key (id)
    )

    create table Session (
       id int4 not null,
        sessionId varchar(255) not null,
        userLogin_id int4,
        primary key (id)
    )

    create table SetScheme (
       id int4 not null,
        load float8 not null,
        reps int4 not null,
        primary key (id)
    )

    create table Training (
       id int4 not null,
        trainingDate date not null,
        exercise_name varchar(255),
        set_id int4,
        primary key (id)
    )

    create table UserTraining (
       id int4 not null,
        trainingId_id int4,
        userLogin_id int4,
        primary key (id)
    )

    create table WeightCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxWeight int4 not null,
        minWeight int4 not null,
        primary key (id)
    )

    alter table GymUser 
       add constraint FK7xla60x8fcjcrliwbr53ja5th 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table GymUser 
       add constraint FKk0atqyp9yh0nlnbdw1o12ca62 
       foreign key (sex_sexName) 
       references Gender

    alter table GymUser 
       add constraint FKh2vykniw42kscj39rdncc53fh 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table LoginData 
       add constraint FKt9yw7n375fo2ucbjn5b531sff 
       foreign key (login_id) 
       references GymUser

    alter table PersonalBest 
       add constraint FKl4fvuu9c1ocwdt10ocfpwjos0 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table PersonalBest 
       add constraint FKdylt0yvvelanmrb7n3riaxysg 
       foreign key (exercise_name) 
       references Exercise

    alter table PersonalBest 
       add constraint FK924swpmgqvfond6ejy3ru6hh4 
       foreign key (user_id) 
       references GymUser

    alter table PersonalBest 
       add constraint FKc2o75jtyjclhlt0qynnkf6wgw 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table Session 
       add constraint FKc3wwqsw9ykwvhwjjijenao2ql 
       foreign key (userLogin_id) 
       references GymUser

    alter table Training 
       add constraint FKhlhq2h388nx99tngpuxdch3e7 
       foreign key (exercise_name) 
       references Exercise

    alter table Training 
       add constraint FKmedjs0jpx6p5hev1d6ajh98kd 
       foreign key (set_id) 
       references SetScheme

    alter table UserTraining 
       add constraint FKa9h1qnht5ucr0ajfa9nkgp8bg 
       foreign key (trainingId_id) 
       references Training

    alter table UserTraining 
       add constraint FKsmotniv50m6ahn4qy8steyyc0 
       foreign key (userLogin_id) 
       references GymUser
create sequence hibernate_sequence start 1 increment 1

    create table AgeCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxAge int4 not null,
        minAge int4 not null,
        primary key (id)
    )

    create table Exercise (
       name varchar(255) not null,
        maxLoad float8 not null,
        maxReps int4 not null,
        primary key (name)
    )

    create table Gender (
       sexName varchar(255) not null,
        primary key (sexName)
    )

    create table GymUser (
       id int4 not null,
        age int4 not null,
        login varchar(255),
        nickname varchar(255),
        weight int4 not null,
        ageCategory_id int4,
        sex_sexName varchar(255),
        weightCategory_id int4,
        primary key (id)
    )

    create table LoginData (
       id int4 not null,
        password varchar(255) not null,
        login_id int4,
        primary key (id)
    )

    create table PersonalBest (
       id int4 not null,
        date timestamp not null,
        rMax1 int4 not null,
        rMax10 int4 not null,
        ageCategory_id int4,
        exercise_name varchar(255),
        user_id int4,
        weightCategory_id int4,
        primary key (id)
    )

    create table Session (
       id int4 not null,
        sessionId varchar(255) not null,
        userLogin_id int4,
        primary key (id)
    )

    create table SetScheme (
       id int4 not null,
        load float8 not null,
        reps int4 not null,
        primary key (id)
    )

    create table Training (
       id int4 not null,
        trainingDate date not null,
        exercise_name varchar(255),
        set_id int4,
        primary key (id)
    )

    create table UserTraining (
       id int4 not null,
        trainingId_id int4,
        userLogin_id int4,
        primary key (id)
    )

    create table WeightCategory (
       id int4 not null,
        categoryName varchar(255) not null,
        maxWeight int4 not null,
        minWeight int4 not null,
        primary key (id)
    )

    alter table GymUser 
       add constraint FK7xla60x8fcjcrliwbr53ja5th 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table GymUser 
       add constraint FKk0atqyp9yh0nlnbdw1o12ca62 
       foreign key (sex_sexName) 
       references Gender

    alter table GymUser 
       add constraint FKh2vykniw42kscj39rdncc53fh 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table LoginData 
       add constraint FKt9yw7n375fo2ucbjn5b531sff 
       foreign key (login_id) 
       references GymUser

    alter table PersonalBest 
       add constraint FKl4fvuu9c1ocwdt10ocfpwjos0 
       foreign key (ageCategory_id) 
       references AgeCategory

    alter table PersonalBest 
       add constraint FKdylt0yvvelanmrb7n3riaxysg 
       foreign key (exercise_name) 
       references Exercise

    alter table PersonalBest 
       add constraint FK924swpmgqvfond6ejy3ru6hh4 
       foreign key (user_id) 
       references GymUser

    alter table PersonalBest 
       add constraint FKc2o75jtyjclhlt0qynnkf6wgw 
       foreign key (weightCategory_id) 
       references WeightCategory

    alter table Session 
       add constraint FKc3wwqsw9ykwvhwjjijenao2ql 
       foreign key (userLogin_id) 
       references GymUser

    alter table Training 
       add constraint FKhlhq2h388nx99tngpuxdch3e7 
       foreign key (exercise_name) 
       references Exercise

    alter table Training 
       add constraint FKmedjs0jpx6p5hev1d6ajh98kd 
       foreign key (set_id) 
       references SetScheme

    alter table UserTraining 
       add constraint FKa9h1qnht5ucr0ajfa9nkgp8bg 
       foreign key (trainingId_id) 
       references Training

    alter table UserTraining 
       add constraint FKsmotniv50m6ahn4qy8steyyc0 
       foreign key (userLogin_id) 
       references GymUser

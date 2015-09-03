// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.net.ftp;


public final class FTPCmd extends Enum
{

    private static final FTPCmd $VALUES[];
    public static final FTPCmd ABOR;
    public static final FTPCmd ABORT;
    public static final FTPCmd ACCOUNT;
    public static final FTPCmd ACCT;
    public static final FTPCmd ALLO;
    public static final FTPCmd ALLOCATE;
    public static final FTPCmd APPE;
    public static final FTPCmd APPEND;
    public static final FTPCmd CDUP;
    public static final FTPCmd CHANGE_TO_PARENT_DIRECTORY;
    public static final FTPCmd CHANGE_WORKING_DIRECTORY;
    public static final FTPCmd CWD;
    public static final FTPCmd DATA_PORT;
    public static final FTPCmd DELE;
    public static final FTPCmd DELETE;
    public static final FTPCmd EPRT;
    public static final FTPCmd EPSV;
    public static final FTPCmd FEAT;
    public static final FTPCmd FEATURES;
    public static final FTPCmd FILE_STRUCTURE;
    public static final FTPCmd GET_MOD_TIME;
    public static final FTPCmd HELP;
    public static final FTPCmd LIST;
    public static final FTPCmd LOGOUT;
    public static final FTPCmd MAKE_DIRECTORY;
    public static final FTPCmd MDTM;
    public static final FTPCmd MFMT;
    public static final FTPCmd MKD;
    public static final FTPCmd MLSD;
    public static final FTPCmd MLST;
    public static final FTPCmd MODE;
    public static final FTPCmd MOD_TIME;
    public static final FTPCmd NAME_LIST;
    public static final FTPCmd NLST;
    public static final FTPCmd NOOP;
    public static final FTPCmd PASS;
    public static final FTPCmd PASSIVE;
    public static final FTPCmd PASSWORD;
    public static final FTPCmd PASV;
    public static final FTPCmd PORT;
    public static final FTPCmd PRINT_WORKING_DIRECTORY;
    public static final FTPCmd PWD;
    public static final FTPCmd QUIT;
    public static final FTPCmd REIN;
    public static final FTPCmd REINITIALIZE;
    public static final FTPCmd REMOVE_DIRECTORY;
    public static final FTPCmd RENAME_FROM;
    public static final FTPCmd RENAME_TO;
    public static final FTPCmd REPRESENTATION_TYPE;
    public static final FTPCmd REST;
    public static final FTPCmd RESTART;
    public static final FTPCmd RETR;
    public static final FTPCmd RETRIEVE;
    public static final FTPCmd RMD;
    public static final FTPCmd RNFR;
    public static final FTPCmd RNTO;
    public static final FTPCmd SET_MOD_TIME;
    public static final FTPCmd SITE;
    public static final FTPCmd SITE_PARAMETERS;
    public static final FTPCmd SMNT;
    public static final FTPCmd STAT;
    public static final FTPCmd STATUS;
    public static final FTPCmd STOR;
    public static final FTPCmd STORE;
    public static final FTPCmd STORE_UNIQUE;
    public static final FTPCmd STOU;
    public static final FTPCmd STRU;
    public static final FTPCmd STRUCTURE_MOUNT;
    public static final FTPCmd SYST;
    public static final FTPCmd SYSTEM;
    public static final FTPCmd TRANSFER_MODE;
    public static final FTPCmd TYPE;
    public static final FTPCmd USER;
    public static final FTPCmd USERNAME;

    private FTPCmd(String s, int i)
    {
        super(s, i);
    }

    public static FTPCmd valueOf(String s)
    {
        return (FTPCmd)Enum.valueOf(org/apache/commons/net/ftp/FTPCmd, s);
    }

    public static FTPCmd[] values()
    {
        return (FTPCmd[])$VALUES.clone();
    }

    public final String getCommand()
    {
        return name();
    }

    static 
    {
        ABOR = new FTPCmd("ABOR", 0);
        ACCT = new FTPCmd("ACCT", 1);
        ALLO = new FTPCmd("ALLO", 2);
        APPE = new FTPCmd("APPE", 3);
        CDUP = new FTPCmd("CDUP", 4);
        CWD = new FTPCmd("CWD", 5);
        DELE = new FTPCmd("DELE", 6);
        EPRT = new FTPCmd("EPRT", 7);
        EPSV = new FTPCmd("EPSV", 8);
        FEAT = new FTPCmd("FEAT", 9);
        HELP = new FTPCmd("HELP", 10);
        LIST = new FTPCmd("LIST", 11);
        MDTM = new FTPCmd("MDTM", 12);
        MFMT = new FTPCmd("MFMT", 13);
        MKD = new FTPCmd("MKD", 14);
        MLSD = new FTPCmd("MLSD", 15);
        MLST = new FTPCmd("MLST", 16);
        MODE = new FTPCmd("MODE", 17);
        NLST = new FTPCmd("NLST", 18);
        NOOP = new FTPCmd("NOOP", 19);
        PASS = new FTPCmd("PASS", 20);
        PASV = new FTPCmd("PASV", 21);
        PORT = new FTPCmd("PORT", 22);
        PWD = new FTPCmd("PWD", 23);
        QUIT = new FTPCmd("QUIT", 24);
        REIN = new FTPCmd("REIN", 25);
        REST = new FTPCmd("REST", 26);
        RETR = new FTPCmd("RETR", 27);
        RMD = new FTPCmd("RMD", 28);
        RNFR = new FTPCmd("RNFR", 29);
        RNTO = new FTPCmd("RNTO", 30);
        SITE = new FTPCmd("SITE", 31);
        SMNT = new FTPCmd("SMNT", 32);
        STAT = new FTPCmd("STAT", 33);
        STOR = new FTPCmd("STOR", 34);
        STOU = new FTPCmd("STOU", 35);
        STRU = new FTPCmd("STRU", 36);
        SYST = new FTPCmd("SYST", 37);
        TYPE = new FTPCmd("TYPE", 38);
        USER = new FTPCmd("USER", 39);
        $VALUES = (new FTPCmd[] {
            ABOR, ACCT, ALLO, APPE, CDUP, CWD, DELE, EPRT, EPSV, FEAT, 
            HELP, LIST, MDTM, MFMT, MKD, MLSD, MLST, MODE, NLST, NOOP, 
            PASS, PASV, PORT, PWD, QUIT, REIN, REST, RETR, RMD, RNFR, 
            RNTO, SITE, SMNT, STAT, STOR, STOU, STRU, SYST, TYPE, USER
        });
        ABORT = ABOR;
        ACCOUNT = ACCT;
        ALLOCATE = ALLO;
        APPEND = APPE;
        CHANGE_TO_PARENT_DIRECTORY = CDUP;
        CHANGE_WORKING_DIRECTORY = CWD;
        DATA_PORT = PORT;
        DELETE = DELE;
        FEATURES = FEAT;
        FILE_STRUCTURE = STRU;
        GET_MOD_TIME = MDTM;
        LOGOUT = QUIT;
        MAKE_DIRECTORY = MKD;
        MOD_TIME = MDTM;
        NAME_LIST = NLST;
        PASSIVE = PASV;
        PASSWORD = PASS;
        PRINT_WORKING_DIRECTORY = PWD;
        REINITIALIZE = REIN;
        REMOVE_DIRECTORY = RMD;
        RENAME_FROM = RNFR;
        RENAME_TO = RNTO;
        REPRESENTATION_TYPE = TYPE;
        RESTART = REST;
        RETRIEVE = RETR;
        SET_MOD_TIME = MFMT;
        SITE_PARAMETERS = SITE;
        STATUS = STAT;
        STORE = STOR;
        STORE_UNIQUE = STOU;
        STRUCTURE_MOUNT = SMNT;
        SYSTEM = SYST;
        TRANSFER_MODE = MODE;
        USERNAME = USER;
    }
}

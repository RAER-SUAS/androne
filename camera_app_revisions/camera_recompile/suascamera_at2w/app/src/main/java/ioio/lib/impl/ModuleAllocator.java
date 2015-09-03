// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package ioio.lib.impl;

import ioio.lib.api.exception.OutOfResourceException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

class ModuleAllocator
{

    private final Set allocatedModuleIds_;
    private final Set availableModuleIds_;
    private final String name_;

    public ModuleAllocator(int i, String s)
    {
        this(getList(i), s);
    }

    public ModuleAllocator(Collection collection, String s)
    {
        availableModuleIds_ = new TreeSet(collection);
        allocatedModuleIds_ = new HashSet();
        name_ = s;
    }

    public ModuleAllocator(int ai[], String s)
    {
        this(getList(ai), s);
    }

    private static Collection getList(int i)
    {
        ArrayList arraylist = new ArrayList();
        int j = 0;
        do
        {
            if (j >= i)
            {
                return arraylist;
            }
            arraylist.add(Integer.valueOf(j));
            j++;
        } while (true);
    }

    private static Collection getList(int ai[])
    {
        ArrayList arraylist = new ArrayList(ai.length);
        int j = ai.length;
        int i = 0;
        do
        {
            if (i >= j)
            {
                return arraylist;
            }
            arraylist.add(Integer.valueOf(ai[i]));
            i++;
        } while (true);
    }

    public Integer allocateModule()
    {
        this;
        JVM INSTR monitorenter ;
        if (availableModuleIds_.isEmpty())
        {
            throw new OutOfResourceException((new StringBuilder("No more resources of the requested type: ")).append(name_).toString());
        }
        break MISSING_BLOCK_LABEL_46;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        Integer integer;
        integer = (Integer)availableModuleIds_.iterator().next();
        availableModuleIds_.remove(integer);
        allocatedModuleIds_.add(integer);
        this;
        JVM INSTR monitorexit ;
        return integer;
    }

    public void releaseModule(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (!allocatedModuleIds_.contains(Integer.valueOf(i)))
        {
            throw new IllegalArgumentException((new StringBuilder("moduleId: ")).append(i).append("; not yet allocated").toString());
        }
        break MISSING_BLOCK_LABEL_52;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        availableModuleIds_.add(Integer.valueOf(i));
        allocatedModuleIds_.remove(Integer.valueOf(i));
        this;
        JVM INSTR monitorexit ;
    }
}

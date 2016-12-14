# What is this?
This is a project to reproduce a bug in Unity to do with a crash when using -buildTarget the command line, to change from the platform last built.

This project is a near-empty Unity project, and a batch file to run batch mode twice, for convenience.

A build doesn't even need to be done - only -buildTarget needs to be used to demonstrate the crash.

It seems to be a regression from Unity 5.4 as it started happening on our CI machines on upgrading to 5.5.0p1.

Example log files from a run of the batch file are included in this repository.

# Repro steps
- Run Unity in batch mode with -buildTarget for any platform (e.g. 'win32')
- Run Unity in batch mode with -buildTarget for a different platform (e.g. 'linux')

# Expected behaviour?
I would expect Unity to not crash.

# Actual behaviour
Unity fails with a crash.

Relevant log lines:

    Targeting platform: linux
    Assertion failed on expression: 'pos < this->m_num_bits'
     
    (Filename: C:\buildslave\unity\build\Runtime/Utilities/dynamic_bitset.h Line: 612)
    
    Crash!!!

Relevant stack trace from log:

    ========== OUTPUTING STACK TRACE ==================
    
    0x0000000140193D70 (Unity) GetPrecompiledAssemblyMask
    0x00000001401AC89B (Unity) ForceRecompileAllScriptsAndDlls
    0x0000000140FA8903 (Unity) UnityConnectSettings::OnEditorBuildTargetChanged
    0x000000014149FDC4 (Unity) EditorUserBuildSettings::SetActiveBuildTarget
    0x0000000141488FE7 (Unity) Application::InitializeProject
    0x000000014154F397 (Unity) WinMain
    0x000000014186A914 (Unity) strnlen
    0x00007FFF9B918364 (KERNEL32) BaseThreadInitThunk
    0x00007FFF9C455E91 (ntdll) RtlUserThreadStart
    
    ========== END OF STACKTRACE ===========

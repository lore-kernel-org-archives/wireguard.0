Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D55AC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:54:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4892D20825
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0Xgvesq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4892D20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31ac6d4e;
	Mon, 13 Jul 2020 23:31:23 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [2607:f8b0:4864:20::d2f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2a0eb90b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Jul 2020 07:16:23 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id k23so38255788iom.10
 for <wireguard@lists.zx2c4.com>; Mon, 06 Jul 2020 00:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gzL3z3Myldv7WgXhEv733ZXf/T88cI755fblxOZWrhI=;
 b=F0Xgvesq6m3w4WScdcQvLYKYp2N3Lazx/QT/rX8ARyzIlPufCKFs5e3grnBaDIYpY7
 u9rihgLYhR3UUwRFZiejX9NTqB65PxSFqMEc41QXl+/oV/AWCQ+0l9JF5uflo8taU41c
 A1mujMFY8NOS4beWL4uouKypBn51/UgLl/bpGweYT2QHMdvGyTgMvqu6DmKR/8MAccop
 eh0+y+mRJ+glrs90qNRcm37RKskjqCnGM36ompXqyCtyZ4C1CswrkKWog5kR2f7FkIEC
 XVoBHHHHiYaiMFjRwwN3xtGkiMd7UELNtjXrKTbS41bnq/ha2ZK5Ns+J4ln29t9saqJv
 ROKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gzL3z3Myldv7WgXhEv733ZXf/T88cI755fblxOZWrhI=;
 b=ata67bNN8YqQzCr5dztEJUBLLg4giiaG4Ul8YNBFzuZ4I/C7p/utRk36ySZEpc8s+b
 14TDV31zZbVbEJcDfezmINc6tJVUvfFgNTFZkYMxhlCt8Rxax0Q4P930GG9ELMlFnVBv
 jKT77TPsCFPSefP4fXK+kcaRjIUhv3p0ZtbG3KbRzrCUfeUMpf01qwCc5xrHhMJbAppa
 3lSPvUUbJHbWeenFxG+gmZp5sPBP7/3VBuKHhOrfcpr3X+J2Hp2qmTsHx5PwDA6KxcOO
 yBejMucPyF6q75tlKt1rUUaowmPU0VE1u8h7sLoI9EBiue2n3UYSVgfvEQecO1SXYJ2O
 ImgA==
X-Gm-Message-State: AOAM533pHDaJpQfRqK2wY/SWvzi3kU+GTpZm7HSD9PrZYhTpNGPP23Qk
 u0gRyQ58lY8rd4WOxAJ1GiNZ1xuG22BIORXQFwiVDdhc
X-Google-Smtp-Source: ABdhPJyvgC4TTg8oyBm9VkRU4H+7E4uuBinyiB/bxDcHjcSXEZvqoYen4c6LgxloaUIC+2bk9tv3LWPmSeIb4iJu0KA=
X-Received: by 2002:a02:3c08:: with SMTP id m8mr19947470jaa.107.1594021015192; 
 Mon, 06 Jul 2020 00:36:55 -0700 (PDT)
MIME-Version: 1.0
From: Markus F <hybrid87@gmail.com>
Date: Mon, 6 Jul 2020 09:36:41 +0200
Message-ID: <CALvS7dHi_pOtLB6rvNuM8Lu9jQ73ijzihrXZ_WUptkbhNWUGkQ@mail.gmail.com>
Subject: WINTUN: Error registering rings (Error 87, INVALID_ARGUMENT)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Jul 2020 01:31:20 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I am currently trying to create a testtool using the WINTUN driver to
establish a 1:1 connection to another client and see what wintun is
capable of. Unfortunately I cannot get the rings to register. I have
written a small testprogram in order to reproduce this.

    #include <windows.h>
    #include <winioctl.h>
    #include <IPHlpApi.h>
    #include <ndisguid.h>
    #include <TlHelp32.h>
    #include <tchar.h>
    #include <securitybaseapi.h>
    #include <cfgmgr32.h>

    #include <stdint.h>
    #include <stdio.h>
    #include <string>
    #include <assert.h>

    #pragma pack(push, 1)
    typedef struct _TUN_PACKET_PROTO {
        ULONG Size;
        UCHAR Data[]; // max packet size as defined by the driver.
    } TUN_PACKET_PROTO;

    typedef struct _TUN_RING_PROTO {
        volatile ULONG Head;
        volatile ULONG Tail;
        volatile LONG Alertable;
        UCHAR Data[];
    } TUN_RING_PROTO;


    #define TUN_IOCTL_REGISTER_RINGS CTL_CODE(51820U, 0x970U,
METHOD_BUFFERED, FILE_READ_DATA | FILE_WRITE_DATA)
    #define TUN_IOCTL_FORCE_CLOSE_HANDLES CTL_CODE(51820U, 0x971U,
METHOD_NEITHER, FILE_READ_DATA | FILE_WRITE_DATA)

    #define WINTUN_RING_CAPACITY        0x800000
    #define WINTUN_RING_TRAILING_BYTES  0x10000
    #define WINTUN_MAX_PACKET_SIZE      0xffff
    #define WINTUN_PACKET_ALIGN         4

    /* Memory alignment of packets and rings */
    #define TUN_ALIGNMENT sizeof(ULONG)
    #define TUN_ALIGN(Size) (((ULONG)(Size) + ((ULONG)TUN_ALIGNMENT -
1)) & ~((ULONG)TUN_ALIGNMENT - 1))
    #define TUN_IS_ALIGNED(Size) (!((ULONG)(Size) & ((ULONG)TUN_ALIGNMENT - 1)))
    /* Maximum IP packet size */
    #define TUN_MAX_IP_PACKET_SIZE 0xFFFF
    /* Maximum packet size */
    #define TUN_MAX_PACKET_SIZE TUN_ALIGN(sizeof(TUN_PACKET_PROTO) +
TUN_MAX_IP_PACKET_SIZE)
    /* Minimum ring capacity. */
    #define TUN_MIN_RING_CAPACITY 0x20000 /* 128kiB */
    /* Maximum ring capacity. */
    #define TUN_MAX_RING_CAPACITY 0x4000000 /* 64MiB */
    /* Calculates ring capacity */
    #define TUN_RING_CAPACITY(Size) ((Size) - sizeof(TUN_RING_PROTO) -
(TUN_MAX_PACKET_SIZE - TUN_ALIGNMENT))
    /* Calculates ring offset modulo capacity */
    #define TUN_RING_WRAP(Value, Capacity) ((Value) & (Capacity - 1))

    #define IS_POW2(x) ((x) && !((x) & ((x)-1)))



    typedef struct _TUN_RING {
        volatile ULONG Head;
        volatile ULONG Tail;
        volatile LONG Alertable;
        UCHAR Data[WINTUN_RING_CAPACITY + (TUN_MAX_PACKET_SIZE-TUN_ALIGNMENT)];
    } TUN_RING;

    typedef struct _TUN_PACKET {
        ULONG Size;
        UCHAR Data[WINTUN_MAX_PACKET_SIZE]; // max packet size as
defined by the driver.
    } TUN_PACKET;

    typedef struct _TUN_REGISTER_RINGS {
        struct {
            ULONG RingSize;
            TUN_RING *Ring;
            HANDLE TailMoved;
        } Send, Receive;
    } TUN_REGISTER_RINGS;
    #pragma pack(pop)

    class regkey_t
    {
    public:
        regkey_t(void);
        regkey_t(HKEY handle);
        ~regkey_t(void);

        void attach(HKEY handle);
        void release(void);

        HKEY detach(void);
        operator HKEY (void) const;
        HKEY &get(void);
        HKEY *operator &(void);

    private:
        regkey_t(const regkey_t &);
        regkey_t &operator = (const regkey_t &);

        HKEY handle_;
    };

    regkey_t::regkey_t():
        handle_(0)
    {
    }

    regkey_t::regkey_t(HKEY handle):
        handle_(handle)
    {
    }

    regkey_t::~regkey_t(void)
    {
        release();
    }

    void regkey_t::attach(HKEY handle)
    {
        release();
        handle_ = handle;
    }

    void regkey_t::release(void)
    {
        if (handle_)
        {
            const LONG res (::RegCloseKey(handle_));
            if (res != ERROR_SUCCESS)
            {
                printf("Couldn't close a reg handle (%lu).\n", res);
            }

            handle_ = 0;
        }
    }

    HKEY regkey_t::detach(void)
    {
        const HKEY result (handle_);
        handle_ = 0;
        return result;
    }

    HKEY &regkey_t::get(void)
    {
        return handle_;
    }

    HKEY *regkey_t::operator &(void)
    {
        return &handle_;
    }

    regkey_t::operator HKEY(void) const
    {
        return handle_;
    }

    bool impersonate_as_system()
    {
        HANDLE thread_token, process_snapshot, winlogon_process,
winlogon_token, duplicated_token;
        PROCESSENTRY32 entry;
        BOOL ret;
        DWORD pid = 0;
        TOKEN_PRIVILEGES privileges;

        ::memset(&entry, 0, sizeof(entry));
        ::memset(&privileges, 0, sizeof(privileges));

        entry.dwSize = sizeof(PROCESSENTRY32);

        privileges.PrivilegeCount = 1;
        privileges.Privileges->Attributes = SE_PRIVILEGE_ENABLED;

        if (!LookupPrivilegeValue(NULL, SE_DEBUG_NAME,
&privileges.Privileges[0].Luid))
        {
            return false;
        }

        if (!ImpersonateSelf(SecurityImpersonation))
        {
            return false;
        }

        if (!OpenThreadToken(GetCurrentThread(),
TOKEN_ADJUST_PRIVILEGES, FALSE, &thread_token))
        {
            RevertToSelf();
            return false;
        }
        if (!AdjustTokenPrivileges(thread_token, FALSE, &privileges,
sizeof(privileges), NULL, NULL))
        {
            CloseHandle(thread_token);
            RevertToSelf();
            return false;
        }
        CloseHandle(thread_token);

        process_snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
        if (process_snapshot == INVALID_HANDLE_VALUE)
        {
            RevertToSelf();
            return false;
        }
        for (ret = Process32First(process_snapshot, &entry); ret; ret
= Process32Next(process_snapshot, &entry))
        {
            if (::strcmp(entry.szExeFile, "winlogon.exe") == 0)
            {
                pid = entry.th32ProcessID;
                break;
            }
        }
        CloseHandle(process_snapshot);
        if (!pid)
        {
            RevertToSelf();
            return false;
        }

        winlogon_process = OpenProcess(PROCESS_QUERY_INFORMATION, FALSE, pid);
        if (!winlogon_process)
        {
            RevertToSelf();
            return false;
        }

        if (!OpenProcessToken(winlogon_process, TOKEN_IMPERSONATE |
TOKEN_DUPLICATE, &winlogon_token))
        {
            CloseHandle(winlogon_process);
            RevertToSelf();
            return false;
        }
        CloseHandle(winlogon_process);

        if (!DuplicateToken(winlogon_token, SecurityImpersonation,
&duplicated_token))
        {
            CloseHandle(winlogon_token);
            RevertToSelf();
            return false;
        }
        CloseHandle(winlogon_token);

        if (!SetThreadToken(NULL, duplicated_token))
        {
            CloseHandle(duplicated_token);
            RevertToSelf();
            return false;
        }
        CloseHandle(duplicated_token);

        return true;
    }

    std::string get_instance_id(uint32_t device_index)
    {
        const std::string
key_name("SYSTEM\\CurrentControlSet\\Control\\Class\\{4D36E972-E325-11CE-BFC1-08002BE10318}");

        std::string device_id("");

        regkey_t adapters;
        DWORD ret = ::RegOpenKeyEx(HKEY_LOCAL_MACHINE,
key_name.c_str(), 0, KEY_READ, &adapters);
        if (ret != ERROR_SUCCESS)
        {
            printf("Could not open registry key %s (%d).\n",
key_name.c_str(), ret);

            return device_id;
        }

        DWORD sub_keys(0);
        ret = ::RegQueryInfoKey(adapters, NULL, NULL, NULL, &sub_keys,
NULL, NULL, NULL, NULL, NULL, NULL, NULL);
        if (ret != ERROR_SUCCESS)
        {
            printf("Could not get info from %s (%d).\n", key_name.c_str(), ret);
            return device_id;
        }

        if (sub_keys <= 0)
        {
            printf("Wrong registry key %s.\n", key_name.c_str());
            return device_id;
        }

        if (device_index >= sub_keys)
        {
            return device_id;
        }

        uint32_t index(0);
        for (DWORD i = 0; i < sub_keys; i++)
        {
            const uint32_t max_key_length = 255;
            TCHAR key[max_key_length];
            DWORD keylen(max_key_length);

            // Get the adapter name
            ret = ::RegEnumKeyEx(adapters, i, key, &keylen, NULL,
NULL, NULL, NULL);
            if (ret != ERROR_SUCCESS)
            {
                continue;
            }

            // Append it to NETWORK_ADAPTERS and open it
            regkey_t device;
            const std::string new_key(key_name + "\\" + std::string(key));

            ret = ::RegOpenKeyEx(HKEY_LOCAL_MACHINE, new_key.c_str(),
0, KEY_READ, &device);
            if (ret != ERROR_SUCCESS)
            {
                continue;
            }

            TCHAR data[256];
            DWORD len(sizeof(data));
            ret = ::RegQueryValueEx(device, "ComponentId", NULL, NULL,
(LPBYTE)data, &len);
            if (ret != ERROR_SUCCESS)
            {
                continue;
            }

            std::string device_name("wintun");
            if (::_tcsnccmp(data, device_name.c_str(), sizeof(TCHAR) *
device_name.length()) == 0)
            {
                if (device_index != index)
                {
                    index++;
                    continue;
                }

                DWORD type;
                len = sizeof(data);

                ret = ::RegQueryValueEx(device, "DeviceInstanceID",
NULL, &type, (LPBYTE)data, &len);
                if (ret != ERROR_SUCCESS)
                {
                    printf("Could not get info from %s (%d).\n",
key_name.c_str(), ret);

                }

                device_id = data;
                break;
            }
        }

        return device_id;
    }

    bool open_tun_fucker()
    {
        HANDLE tun_fd_ = INVALID_HANDLE_VALUE;
        std::string device_id;
        uint32_t device_index;
        {
            TCHAR *interface_list = nullptr;
            for (device_index = 0; device_index < 256; ++device_index)
            {
                device_id = get_instance_id(device_index);
                if (device_id.empty())
                {
                    continue;
                }

                CONFIGRET status = CR_SUCCESS;

                // This loop is recommended as "robust code" by MSDN.
See the Remarks of CM_Get_Device_Interface_list.
                do
                {
                    DWORD required_chars(0);
                    if ((status =
::CM_Get_Device_Interface_List_Size(&required_chars,

(LPGUID)&GUID_DEVINTERFACE_NET,
                                                            (char
*)device_id.c_str(),

CM_GET_DEVICE_INTERFACE_LIST_PRESENT)) != CR_SUCCESS ||
!required_chars)
                    {
                        break;
                    }

                    assert(required_chars > 0);
                    interface_list = (TCHAR *)::malloc(sizeof(TCHAR) *
required_chars);

                    status =
::CM_Get_Device_Interface_List((LPGUID)&GUID_DEVINTERFACE_NET,

(char *)device_id.c_str(),

interface_list,

required_chars,

CM_GET_DEVICE_INTERFACE_LIST_PRESENT);

                    if (status == CR_SUCCESS)
                    {
                        break;
                    }

                    ::free(interface_list);
                    interface_list = nullptr;
                } while(status == CR_BUFFER_SMALL);

                if (interface_list)
                {
                    break;
                }
            }

            if (!interface_list)
            {
                printf("Could not find wintun interface.\n");
                return false;
            }
            else
            {
                tun_fd_ = ::CreateFile(interface_list,
                                       GENERIC_READ | GENERIC_WRITE,
                                       FILE_SHARE_READ |
FILE_SHARE_WRITE | FILE_SHARE_DELETE,
                                       nullptr,
                                       OPEN_EXISTING, 0, nullptr);
            }


            ::free(interface_list);
        }

        if (!tun_fd_ || tun_fd_ == INVALID_HANDLE_VALUE)
        {
            printf("Could not open wintun device.\n");
            return false;
        }

        printf("Opened wintun device.\n");


        // Must be create wie CreateFileMapping or else stuff fucks up
in a fucked up manner and
        // you never will find out how because shit is not documented
and reading NDIS driver code is at
        // least the seventh ring of hell, if not even the eight. So
just do it because fuck that.

        // Zwei Ringe sie zu knechten und all so ne scheiss...


        TUN_RING * send_ring_ = (TUN_RING *)::malloc(sizeof(TUN_RING));
        TUN_RING * recv_ring_ = (TUN_RING *)::malloc(sizeof(TUN_RING));

        if (!recv_ring_ || !send_ring_)
        {
            printf("Could not malloc.\n");
            return false;
        }

        ::memset(send_ring_, 0, sizeof(*send_ring_));
        ::memset(recv_ring_, 0, sizeof(*recv_ring_));

        recv_ring_->Alertable = TRUE;
        recv_ring_->Head = 0;
        recv_ring_->Tail = 0;
        send_ring_->Alertable = TRUE;
        send_ring_->Head = 0;
        send_ring_->Tail = 0;

        SECURITY_ATTRIBUTES sa;
        SECURITY_DESCRIPTOR sd;

        ::memset(&sa, 0, sizeof(sa));
        ::memset(&sd, 0, sizeof(sd));

        sa.nLength = sizeof(SECURITY_ATTRIBUTES);
        sa.lpSecurityDescriptor = &sd;
        sa.bInheritHandle = FALSE;
        if (!::InitializeSecurityDescriptor(&sd, SECURITY_DESCRIPTOR_REVISION))
        {
            printf("Cannot init security descriptor.\n");
        }
        else
        {
            if (!::SetSecurityDescriptorDacl(&sd, TRUE, NULL, FALSE))
            {
                printf("DACL failed.\n");
            }
        }

        HANDLE send_event = ::CreateEvent(&sa, TRUE, FALSE, 0);
        HANDLE recv_event = ::CreateEvent(&sa, TRUE, FALSE, 0);
        // register the rings
        if (impersonate_as_system())
        {
            TUN_REGISTER_RINGS reg_rings;
            ::memset(&reg_rings, 0, sizeof(TUN_REGISTER_RINGS));
            reg_rings.Send.RingSize = sizeof(TUN_RING);
            reg_rings.Send.Ring = send_ring_;
            reg_rings.Send.TailMoved = send_event;
            reg_rings.Receive.RingSize = sizeof(TUN_RING);
            reg_rings.Receive.Ring = recv_ring_;
            reg_rings.Receive.TailMoved = recv_event;


            int send_capacity = TUN_RING_CAPACITY(reg_rings.Send.RingSize);

            if ((send_capacity < TUN_MIN_RING_CAPACITY ||
send_capacity > TUN_MAX_RING_CAPACITY ||
                 !IS_POW2(send_capacity) || !reg_rings.Send.TailMoved
|| !reg_rings.Send.Ring))
            {
                printf("Fuck this shit I am out...\n");
            }


            DWORD len;

            DWORD fuckyou = 0;
            if (!::DeviceIoControl(tun_fd_, TUN_IOCTL_FORCE_CLOSE_HANDLES,
                                   &fuckyou, sizeof(fuckyou), nullptr,
0, &len, nullptr))
            {
                printf("Error releasing handles (%d).\n", ::GetLastError());
            }


            if (!::DeviceIoControl(tun_fd_,
                                    TUN_IOCTL_REGISTER_RINGS,
                                    &reg_rings,
                                    sizeof(reg_rings),
                                    nullptr,
                                    0,
                                    &len,
                                    nullptr))
            {
                printf("Could not register ring buffers (%d).\n",
::GetLastError());
                RevertToSelf();
                return false;
            }
            RevertToSelf();
        }
        else
        {
            printf("Could not elevate to SYSTEM\n");
            return false;
        }



        return true;
    }

    int main()
    {
        if (!open_tun_fucker())
        {
            printf("Experiment failed.\n");
        }

        printf("Size TUNRING: %d (%d)\n", sizeof(TUN_RING),  0x800000
+ 0x010000 + 0x0C);
        printf("Capacity: %d\n", TUN_RING_CAPACITY(sizeof(TUN_RING)));
        if (!IS_POW2(TUN_RING_CAPACITY(sizeof(TUN_RING))))
        {
            printf("Shit gone wrong...\n");
        }

        return 0;
    }


I cannot figure out what I am doing wrong. Can somebody point out the
error for me? Thanks!

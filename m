Return-Path: luci@powerneth.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f582c62
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 08:58:11 +0000 (UTC)
Received: from mail.intelterm.ro (174.15.122.86.static.cluj.rdsnet.ro
 [86.122.15.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72742969
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 08:58:10 +0000 (UTC)
Received: from [192.168.123.118] (unknown [212.54.114.2])
 by mail.intelterm.ro (Postfix) with ESMTPSA id D609A2218C78
 for <wireguard@lists.zx2c4.com>; Tue,  3 Jul 2018 12:04:34 +0300 (EEST)
Subject: Re: src/crypto/curve25519-x86_64.h:1319: Error: no such instruction
 while compiling in centos 6
Cc: wireguard@lists.zx2c4.com
References: <CAK+ZqRryNNWq1yhAQKbzOxTKrzRmO_gfM47F18YCGOiYcdumdg@mail.gmail.com>
 <CAHmME9ooS8c-QmB6X_ySTZiYsK98vFQ-bpws6TJUUJ3sE-aCLQ@mail.gmail.com>
 <CAK+ZqRqA4BkCLmxnuNfRtNByXaDYv1MpZB44PZrCM_Mx_ncNRw@mail.gmail.com>
 <98b1fd4b-ebc9-b6b6-41e0-29a12e351335@powerneth.ro>
 <CAHsAZcDjnM-6iwRHv7-fsEMBA=XuncR8yh+0vTdksiADb0=CuQ@mail.gmail.com>
From: Lucian Cristian <luci@powerneth.ro>
Message-ID: <c3f38297-e269-2ea3-7104-8572c2db8f13@powerneth.ro>
Date: Tue, 3 Jul 2018 12:04:32 +0300
MIME-Version: 1.0
In-Reply-To: <CAHsAZcDjnM-6iwRHv7-fsEMBA=XuncR8yh+0vTdksiADb0=CuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 03.07.2018 11:59, Vbook A1 wrote:
> WARNING: if you want to use ELrepo kernel - make sure your server does
> not have the Matrox G200 series video card! CentOS 6.x with kernel 4.x
> will not boot on Matrox GPU.
>
> On Tue, Jun 26, 2018 at 1:10 PM, Lucian Cristian <luci@powerneth.ro> wrote:
>> On 26.06.2018 05:57, karthik kumar wrote:
>>
>> Hi,
>>    I did see the yum repo already being there RPMs available. But we use only
>> centos 6 and are desperately looking for alternate of strongswan :(
>> Is there any other suggestion for me, other than Centos 7 ? Is it worth
>> trying to rebuild the kernel with 8.1 gcc ? Is there an option like
>> --without-elliptic-curve that I can use ?
>>
>> Thanks
>>
>> On Tue, Jun 26, 2018 at 5:58 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>> Hello,
>>>
>>> Please use CentOS 7.
>>>
>>> Jason
>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>> search the mailing list, I proposed a patch for centos 6, see if it's
>> working, but you have to use elrepo kernels
>> http://elrepo.org/linux/kernel/el6/x86_64/RPMS/
>>
>>
>> Regards
>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
I don't remember having trouble on a fujitsu rx300 with

10:05.0 VGA compatible controller: Matrox Electronics Systems Ltd. MGA 
G200e [Pilot] ServerEngines (SEP1) (rev 02)

but I've updated since then

Regards

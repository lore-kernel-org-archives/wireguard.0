Return-Path: vbooka1maillist@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03e22006
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 08:53:45 +0000 (UTC)
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 318594a8
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 08:53:45 +0000 (UTC)
Received: by mail-oi0-x244.google.com with SMTP id k12-v6so2281876oiw.8
 for <wireguard@lists.zx2c4.com>; Tue, 03 Jul 2018 02:00:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <98b1fd4b-ebc9-b6b6-41e0-29a12e351335@powerneth.ro>
References: <CAK+ZqRryNNWq1yhAQKbzOxTKrzRmO_gfM47F18YCGOiYcdumdg@mail.gmail.com>
 <CAHmME9ooS8c-QmB6X_ySTZiYsK98vFQ-bpws6TJUUJ3sE-aCLQ@mail.gmail.com>
 <CAK+ZqRqA4BkCLmxnuNfRtNByXaDYv1MpZB44PZrCM_Mx_ncNRw@mail.gmail.com>
 <98b1fd4b-ebc9-b6b6-41e0-29a12e351335@powerneth.ro>
From: Vbook A1 <vbooka1maillist@gmail.com>
Date: Tue, 3 Jul 2018 15:59:39 +0700
Message-ID: <CAHsAZcDjnM-6iwRHv7-fsEMBA=XuncR8yh+0vTdksiADb0=CuQ@mail.gmail.com>
Subject: Re: src/crypto/curve25519-x86_64.h:1319: Error: no such instruction
 while compiling in centos 6
To: Lucian Cristian <luci@powerneth.ro>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

WARNING: if you want to use ELrepo kernel - make sure your server does
not have the Matrox G200 series video card! CentOS 6.x with kernel 4.x
will not boot on Matrox GPU.

On Tue, Jun 26, 2018 at 1:10 PM, Lucian Cristian <luci@powerneth.ro> wrote:
> On 26.06.2018 05:57, karthik kumar wrote:
>
> Hi,
>   I did see the yum repo already being there RPMs available. But we use only
> centos 6 and are desperately looking for alternate of strongswan :(
> Is there any other suggestion for me, other than Centos 7 ? Is it worth
> trying to rebuild the kernel with 8.1 gcc ? Is there an option like
> --without-elliptic-curve that I can use ?
>
> Thanks
>
> On Tue, Jun 26, 2018 at 5:58 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Hello,
>>
>> Please use CentOS 7.
>>
>> Jason
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
> search the mailing list, I proposed a patch for centos 6, see if it's
> working, but you have to use elrepo kernels
> http://elrepo.org/linux/kernel/el6/x86_64/RPMS/
>
>
> Regards
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

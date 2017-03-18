Return-Path: saschagrunert@icloud.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 542fe57c
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Mar 2017 10:47:13 +0000 (UTC)
Received: from st11p01im-asmtp002.me.com (st11p01im-asmtp002.me.com
 [17.172.204.152])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a5b907f
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Mar 2017 10:47:12 +0000 (UTC)
Received: from process-dkim-sign-daemon.st11p01im-asmtp002.me.com by
 st11p01im-asmtp002.me.com
 (Oracle Communications Messaging Server 7.0.5.38.0 64bit (built Feb 26 2016))
 id <0ON000L00BFWCG00@st11p01im-asmtp002.me.com> for wireguard@lists.zx2c4.com;
 Sat, 18 Mar 2017 10:51:07 +0000 (GMT)
Content-type: text/plain; charset=utf-8
MIME-version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: Rust implementation status
From: Sascha Grunert <saschagrunert@icloud.com>
In-reply-to: <8726b4ef-f654-4be5-8025-865a55187c77@Spark>
Date: Sat, 18 Mar 2017 11:51:00 +0100
Message-id: <6D082187-55EF-49E0-AF0D-71B648984B14@icloud.com>
References: <E63B612D-BFAA-48FE-A352-25B4C11B8E05@icloud.com>
 <15acda6e9bc.b852f6478142.4195445703657110954@mysterious.site>
 <8726b4ef-f654-4be5-8025-865a55187c77@Spark>
To: sopium <sopium@mysterious.site>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Folks,

To make it clear for now: If you want to contribute, simply use GitHub =
issues and pull requests. I will take care of the synchronisation of the =
repositories for now.

It would be really cool if we can focus on merging our efforts and =
planning the next steps via GitHub issues. Discussions via the mailing =
list are very welcome as well.

I merged the first pull request for now. Thank you very much and have a =
nice weekend!

Best regards,
Sascha


> Am 14.03.2017 um 19:49 schrieb Sascha Grunert =
<saschagrunert@icloud.com>:
>=20
> Hey guys,
>=20
> I would really like to do that. For the main development I would throw =
this into discussion: =
https://github.com/WireGuard/wireguard-rs/issues/1#issuecomment-286521908
>=20
> I guess it would be more visible to the Rust community if we allow =
maintaining it via the GitHub repository.
>=20
> @Jason, what do you think?
>=20
> Best regards,
> Sascha
>=20
> Am 14. M=C3=A4rz 2017, 17:29 +0100 schrieb sopium =
<sopium@mysterious.site>:
>> Hi Sascha and folks,
>>=20
>> ---- On Sun, 05 Mar 2017 20:42:00 +0900 Sascha Grunert =
<saschagrunert@icloud.com> wrote ----
>>> Hey folks,
>>>=20
>>> I want to call for participation of the Rust userspace =
implementation of WireGuard. The template for the initial implementation =
was this: https://www.wireguard.io/xplatform/ and can be found here: =
https://git.zx2c4.com/wireguard-rs/.
>>>=20
>>> What works for now:
>>>=20
>>> - A main working executable (`cargo run -- -h`) which parses the =
command line parameters via the `clap` crate
>>> - General debug and tracing support via the `log` crate
>>> - Daemonizing support
>>> - The wireguard library which creates a local socket and waits for =
incoming connections (reference implementation)
>>>=20
>>> [...]
>>=20
>> I have kept an eye on this. It seems that you were mostly working
>> on the `xplatform` stuff, and haven't started on the actual
>> implementation of the protocol yet. My code has (partly)
>> implemented the protocol, but lacks the `xplatform` ui. So it
>> seems like a perfect time to merge efforts. What do you think?
>>=20
>> And to all who are interested in userspace WG impls, in
>> particular Rust impls, I have adjusted the goal of my project to
>> =E2=80=9Cto write a secure, compatible, cross-platform and reasonably
>> fast user-space implementation of WireGuard in Rust=E2=80=9D. I am =
also
>> committed to finishing and maintaining it. There is a big TODO
>> list, and contribution is welcome!
>>=20
>> For those not closely following this thread, the project is at:
>>=20
>> https://github.com/sopium/titun/tree/wg
>>=20
>> Regards,
>> Sopium
>>=20
>>=20

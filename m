Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b035250d
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 16:37:51 +0000 (UTC)
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
 [209.85.214.67])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bc19030
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 16:37:51 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id o20-v6so3317433itc.1
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 09:38:05 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com.
 [209.85.214.47])
 by smtp.gmail.com with ESMTPSA id b10-v6sm1025167itc.18.2018.04.20.09.38.03
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Apr 2018 09:38:03 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-it0-f47.google.com with SMTP id 186-v6so3228831itu.0
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 09:38:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pZtn8i5dFC1xPNj-9x3yE+zKy86JWDtVB_mgJxNo=cpw@mail.gmail.com>
References: <86d4ddc168ce2c5ac69bede349a44b50d68d6555.camel@e-queo.com>
 <c2634cf8-28bf-816f-fe91-6e988cc6bbdc@gmail.com>
 <CAHmME9pZtn8i5dFC1xPNj-9x3yE+zKy86JWDtVB_mgJxNo=cpw@mail.gmail.com>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Fri, 20 Apr 2018 12:38:02 -0400
Message-ID: <CAK_h9uGCHrEU6uONmFW-coukMTXwZgpkenbbXnfaENpdJBJxJA@mail.gmail.com>
Subject: Re: Problems with IP
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

The recently released RHEL 7.5 ships with iproute2 4.11.0 so,
shouldn't have the problem.

If someone is interested in maintaining a patched version of 3.10.0
for prior RHEL versions the commit which added suppress_prefixlength
can be found at
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?h=v3.12.0&id=b1d0525f9cc3ef6fa7670ff3769828404cea31d4

It first appeared in version 3.12.0. The patch applies cleanly on top
of iproute 3.10.0. Whether it does on Redhat's patched version of
3.10.0 I don't know.

On Fri, Apr 20, 2018 at 11:56 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hey Joe,
>
> Maybe we should patch the rpm for RHEL in some way? I can probably work
> around the old iproute2 by doing a different ip-rule(8) trick, if you'd be
> up for shipping that.
>
> Jason
>
> --
> Sent from my telephone.
>
> On Fri, Apr 20, 2018, 16:48 Aaron Jones <aaronmdjones@gmail.com> wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA256
>>
>> On 20/04/18 14:32, bessonov.victor@e-queo.com wrote:
>> > I've tried to run this instruction manually, result is still the
>> > same. The system runs CentOS 7 and properly updated.
>>
>> Updated, yes; but not up to date. The version of iproute2 is too old.
>>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v2
>> Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/
>>
>> iQIcBAEBCAAGBQJa2f2dAAoJEIrwc3SIqzASCVMP/A9tBO8Sbl1z9rGK0q9vjdyK
>> kMeFxKGVWqR4Xz8Sy9wfS+iKeXlBQxKukaZCTuSDr9WzsbpzvohYcE0FvGuDPZgf
>> G9TgrGK9NAPow6pIdCfgeIIUnBQQ5geLtnxXKdrr7yaXn2rB8KWi1nwM+NbenNnC
>> iJcPe7U9I+RzlDwESTHJMJJGR4hI8zbRSU4H3Nb2PEoYpizHUQuG56RGmOSDO08a
>> 1+uol4iBsR0EEBqyt3PUDjuSTjXSAm6G328pErC+aU6I9wP+FHsFUvfMnVd7GDG1
>> mJfVx2R8mLInlWX0gpL9YgelOC+/jIRDOeNKvdQAoqF3+7Tz+mT7J++/FLdQa3Sq
>> mgHaX+Tvjw6Rnl9KEYC9DqclmHuaoeAHtp7FGnxOXrSOE6fwVh/4BsfKKb7ntU0C
>> Wn0tRNrd/QagFm9Nyytm1g1IjoD/B+dXo9cT9p+bls/wBis4+jZZqJte40Kg1MaT
>> TlUeyLqVqXMWoUyqqn7Rit4E5ejgPbQpPywdKlJKCQrW4OoU+ualW+t+LUrluPAQ
>> ANQkenewaPmoEY4wLGJx02LeD8heYRGzVDkBMmohMiaSVgwibOfxcea7WiggcMNy
>> HICqRz1rCHIhDa0togIb2YPSiVsz+7rqW6shUgFabpDV3c7edfaZNcu5KwW5laCk
>> nY6A1S5hrgEOr3E8iPeK
>> =mFFE
>> -----END PGP SIGNATURE-----
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c736f64b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 01:28:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56a08f3b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 01:28:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fdd32091
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 01:28:29 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a197so205897414wmd.0
 for <wireguard@lists.zx2c4.com>; Tue, 15 Nov 2016 17:31:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
 <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 02:31:13 +0100
Message-ID: <CAHmME9rUEA7ZXjZj5Th45X-tHEZfTQB134M+ym0sqyK3a4a4og@mail.gmail.com>
To: Egbert Verhage <egbert@eggiecode.org>
Content-Type: multipart/mixed; boundary=94eb2c1a08805e5f5d0541610735
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Seeking Ubuntu PPA Maintainer
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1a08805e5f5d0541610735
Content-Type: text/plain; charset=UTF-8

Hey Egbert,

On Wed, Nov 16, 2016 at 1:34 AM, Egbert Verhage <egbert@eggiecode.org> wrote:
> I mailed/called with one of the sys admins and discussed with him about the
> problem in the AVX2 extention.
> I think I'm going to mail/call the hosting company again.

It seems like the crux of the issue is that if they disable AVX2
instructions, they need to make this known in the CPUID. Otherwise the
operating system will assume it's there when it isn't.

> Can give you a vps if you want to. Just 3 euro the month.

See the attached tarball. Compile the kernel module in there and load
it BEFORE WireGuard. You might have to manually unload wireguard for
this to work: "rmmod wireguard && insmod ./avx2disabler.ko && modprobe
wireguard", for example. It should disable avx2 inside the kernel,
solving the issue.

Jason

--94eb2c1a08805e5f5d0541610735
Content-Type: application/x-xz; name="avx2disabler.tar.xz"
Content-Disposition: attachment; filename="avx2disabler.tar.xz"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ivk94k7f0

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj4Cf/AnpdADCdi2rwx3M0ciEqwZT/c9jkuTcx+/MMb57B
I2Hjb9wT78Kx79sbAvfWcVw/92qnUwsmcpj0HOHu6Y41cDXFc2C0HemAqeJmVtapXI3Taj4EhAOY
K4P2cCmc+iE98equQ45SxsW8vQSpaMZ50Uey/eB5Q3C3YnYxVGJDV8QCfvMFfyLv4NS+bZ/7ZCkh
PLzlUfD2QzUmnfm2C0GRI1ES1O4+j1hLoaJHFWX0A3j7KXQCeMXTZUl7u0tH/LM4RQQ9NL5+b3ak
7yBO0AqtR9pLqvrrbIwrkMIdiz+VN+IztFvG4qzSwvF5tQDjEH30HBR+Iune7cjO3UWBbUSCGo4Y
OMlMXdjPYYSe0Q7N+npf30g8m6cFYIBXTgeuk48mwIwiXNq7oLr6WArr/SBRvdyYaueeswcE5b5+
+rvR2pXH19zFKf5NyWxf1uIY0CAnPQHwWvYbG6g20U93VoF1g6P7TDyXrtq25LfoEAlP3c4+h4v6
J9a+eEcWY6DVlYOPp8tpaSKsjTA7pRf/GoFh7w/ffiHXdjM+9wFHxA8oJk3ly08rp8aS+C6Iqclu
7hDKSwiqMYOEhFDnViCbDisXBiMExudmnf9X0mgG1wkcIKkr7jVGqC2ASSdQb0XAUeIIIAGHH7Os
qNgNrmgFU7p5Pl+0BEtI5l842vpHW9etq/jUAH6oLKfBiMpO48fkxBLkWxx6wTXBoxP3Bb0q//ut
1XLBtyw88UdC0HfNYaz0hRcMaj35izUPVFTPuuNjc/uC5+Wtij8O2CTF4Q/dJZALaFUU44Jgkvs1
9qfDZLEUb4ixbrzNdavB9dhH0lXOHpyMF8ypqxxzUFN+cKqxtQAAAAA6UuqUQj/szgABlgWAUAAA
eDZvQbHEZ/sCAAAAAARZWg==
--94eb2c1a08805e5f5d0541610735--

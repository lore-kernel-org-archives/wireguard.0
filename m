Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09925C35670
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:31:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96832214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:31:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3sShUtx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96832214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc323c47;
	Sun, 23 Feb 2020 10:27:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc0f0d57
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 10:22:59 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a19c420
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 10:22:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t3so16107218wru.7
 for <wireguard@lists.zx2c4.com>; Sun, 16 Feb 2020 02:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:subject:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=uqpwitYsbr1Zk+9Nzndjt2YKf9AfS3ICbxuChkDYPK8=;
 b=G3sShUtxJraLXyo7mqCU4oFze7VrNgVMpYVk2OF7VFNFjQ65KuPfL3WZ1tewUts0BQ
 1IM8vjpoEr8uKvs4ZReJxn+dn4W4pX+4YJXAyLryXO/KcoZpXN+Mk5xQopLNMs/03YFN
 z0QymlNVflkdY4qHI5j3DdsDWsq6eIPDjpF1gvpSyHS4lelp2KAD4NDcxDsl7DWQp1LP
 QEqmBmsxxuSoKmy6M1WF9rZmdNh7lWRqPP1GPHCzeEJxpal85gI6MxwsVEs21W0HE9KU
 /V0XqchBCxsq/DPLkhwf5RwHHVVvm1f7ps2FPApVDZKIyXidRqNv0hfDoI03oFA9uLSj
 ITiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:subject:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=uqpwitYsbr1Zk+9Nzndjt2YKf9AfS3ICbxuChkDYPK8=;
 b=qq1tv9ftTXPtyfoFc8BfD6Hlmd0idaOE5RenSXS3xKbd65kZMLdH6YWtQwAVh1NRS0
 RVAE57VzT64kim0BvRSeEruQ5F/TcXbi15qOJq6zIX9MvqkeB/b76UBrr5mWv8rtg3Fu
 ZhUxeUgZbjHweDIm9LbJNWSEqisfwq/DncFZYGT+FBq0uHwvcuqOtKQ6QVmMsRCGx0x2
 LdRGM9MZw7JoCBe5wd1E4UASmP2KcHknzzGezaLDMy1VE+rE9Zj7cyALnI1ozlC2FyOv
 JuhvJZIlN6L1/G7HGWWSbv79NqVzxLGaHUc91hU418J5XbfoUiOET6xapn+G3+NHK/V7
 QJ3A==
X-Gm-Message-State: APjAAAXk34Y0GUyL3oi5IQKM9ck7nUmyh04oCda+hb1SqpZwaISjx927
 5WTV1M1P/iU3HVcizbLzVKCFpjnO
X-Google-Smtp-Source: APXvYqwUu1wWnMlRhxXg/4NvS2fDq5uvrrjxEzzxunTYYE0akHcb22yWAcPln0DBgLDCSW1CKPD9GA==
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr14806844wrn.85.1581848719265; 
 Sun, 16 Feb 2020 02:25:19 -0800 (PST)
Received: from ?IPv6:2a02:908:4b25:3ec0:be5f:f4ff:fef7:960b?
 ([2a02:908:4b25:3ec0:be5f:f4ff:fef7:960b])
 by smtp.gmail.com with ESMTPSA id w19sm15333390wmc.22.2020.02.16.02.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 02:25:18 -0800 (PST)
To: jason@zx2c4.com
References: <CAHmME9pkfWKaG_OZEPS5hWn=LU4H4zHM3fP3NXkbw5VYdQSbaw@mail.gmail.com>
Subject: Re: Starting tunnels without being admin on Windows
From: Eicke Herbertz <wolletd@gmail.com>
Autocrypt: addr=wolletd@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFYaTFUBEADAsM8OuSfR5uDpagDwvOu6wz/7MPxY3mkFF0T8xF2Dr/53d7JGUuJVn2aL
 m1ygnP0OVxmh2ctQhK88WknPljgi8SWup7w+KpnJii+AtkPoQIoLwCasyc4wme0iPz9UOI1x
 BGYe4pYCL+E5bjiI+uTHguHYw26KmVUVrln3GCqzB7vGUDvg3v4YMiPDmO2aPz6Z9XirDUts
 F2gKdV4Tk3tJr3LSIr2OoCO3VVVqCelaq24bcvUF/9vAROuNZINqwK3AUrmO0+rbEcKIXXco
 39wlH7t2DLeubj+kmpJ+vZsg/inDwgJysv4lGtEoVpAw8MJV1adv/Ur9e39wQxmmxcuLL+t+
 Vw05+l1msvDOjP2JtljNx8yCrZ54n6WEjOVK+i3CTImxBzTdiRtl42joP2LAUVBNW5qxoxji
 2x7qPFyLbksJfRkgjMEGYWHtL1cgDTXuYgingR8MsFsdps6TxW8AkSYwYgBfX7g6VLDy41tD
 NmvDyijO9Y5RL0Xy/FWF8RiNcEkKNVTIxbI5PqjH/Imj/OPpqPWDzkmnRT7PTUaKYLZIbULE
 UgoTRz+O25O5LdvtQJM4DV52eIHJeZvyzjvxmLgwWR/ljTKBfNp8q2ZbjH0eSd81eYs+x8HN
 9VxWJIhkhjFgwoeNdi0VLN+mFsrY7D1wKGZZO1lSZB/a/kLuZQARAQABtCJFaWNrZSBIZXJi
 ZXJ0eiA8d29sbGV0ZEBnbWFpbC5jb20+iQI9BBMBCgAnBQJWGkxVAhsjBQkJZgGABQsJCAcD
 BRUKCQgLBRYCAwEAAh4BAheAAAoJEKwdhab7naZiqIIP/0IN09WvaTb1houa86zQx6gvrOWq
 A1kXKZC4zsvu38SWzVlRWYlSO2SE+29x/0irilYc+srUbNBbmdekYWaHzFHratLFmj52hSsN
 KkPlOCZahA1g4DEsF1aNy8pIA32yuezj6vuw1HeGbMop89KzVIcEtMXWBt38w3eyiJVCQTto
 0WTKH4tVxPdB96KP7Xp6Z4sYb4CrzOgUSplRc6BhDYaNlAdQHAu8sTlkMVXgut7quSjNfBTu
 Yfuoe3CSdn/qlU3uudmquhoc11P+m6wt1IKxZOkE5D+rX21v7zJQ4c61vR/IB9qm0eBVWvHe
 Op7I4+3GDxn2GgEczp9mK2tcuXlBgOm4+WorBhVB+e2ujAUi6K1cChso1WwGxgPRmkeFQGAd
 6dKsgzeXjAd9StItWNno1UlCOyQ2fa8QljWKT0ot2IKBMRINE3yaVrd8+OpmMNe4Rq2Qn+1a
 8kXv5GV8Sg51cjkNvCXLxbZ4kiMBhi9NdBBgA4g2pwcWntgc22mMEqRFt3Cnzstw39RfiAKo
 2crcEBhbtzNpgSDbIkU0u4th7Q7UTiQANAPLZyIteX03/9C/8RhPSkGgRnmFZ5qfOqOYzsKi
 n5OHIbZ6xjnCnd68yKG1rOY8B7RFnGAADA+ma5/YZY+yqUZmikkeWNUbiuDb6XZNAxXsarNl
 wAOSDOkfuQINBFYaTFUBEAC7SkbAZ4Q9rp1tc6OgDv8D7PfK7wDd4K9NnMfNK3ZZ7jAtdyDa
 JP3z3w1Jv8SY4CTaFnjMWO/qmWdmrnuQ1kxukRVCz+3ozebfodkg+qJABGvNiPVHkSgIkDaZ
 oLRzdjMI6DGEy/R6SR+eyPlZLQV8vI7qhF7dSH7H8Oi3tP82vdf1Cb7P77JHkBdfxA6kIXlv
 EelEK5Tqm93cu0/M+w/qbMIo37BajDx3FNx6ehbycmrI+La2qDbGRpwo87ZerEmAa4ZuytHK
 KaXkZGHm/R/iGMQTDgCvYkDNk2rH4LXr91cZQoThK/vhxkPZ2GHqUBZatJwXWfRlVJeSDKv7
 9CLyLKXYcczko4YoAhBnd4UaxPtKh2cSFDJoXlBmcqs3+SRCpFkel6jyucX5AcTv2Xj8SZlA
 cEkJ+ZVrjw7CV87z2/A2b0CUkhR7DxE5jJu40x3p1I3RtEzEMxYAoRrZJZdnXl/oe/zfH+AP
 KwKi21WD2GLJ7hw2awrlGpHXov5ki14CzRJUxiobcpyM22MHmZETHYp5tnjzwKCbkmxdd43r
 2gEUd/BzrY3QAM8DgP4xPqqM42060StI5S/onVwxGEDh8Yi4NW1agdQHZq2JmgqvpZbz27oa
 xRD2Wc7sQnHw2RL8QN+IQE/EuB5ew/0rb+Kwa3srfOZdEeb1CbemNjehPQARAQABiQIlBBgB
 CgAPBQJWGkxVAhsMBQkJZgGAAAoJEKwdhab7naZi/SsP+wYxcA0lJ8CKqSJqNdBbe5lNrd1I
 fj2uItvpKlGW6bVEUJciwIm7/EXHMYvsLytKmLFY8mLGY65PSI5+MALQjn06PCSuJtaJsWIo
 mgboEiN6jJEH2Ie0w4VALqVSmknIf/GHqq71InOZp+mZaThVc028TKdUGcWOQzfL0Oz+0oYI
 EIHI7sLxQkSoTsj2OocEVUkgIyirUqCzvNdKKt6g7IKmD8hL7+hK3FEUyxeyYHrRizicpPpA
 vwKe6z/O7Kr4RH//Gl12ZLR2NS7Ip5jKi7QcfOD5Ftd+hJDe5Hn14YMF5lCbylYp6iR4WSHm
 b3V4/sXf+BPYpANjb0phHeBjz0P0cEfwaWmjCLEyBBRFfFcEk3nhqu4FkeZ3cYdL+udH6hjj
 LpmYWsT1ZRc8nyQXxR/Wr3povELTzpKI16i2BtNXN0Mw3FZ4dgbvIbyFphbxcOFT71/XXx+3
 lLA9D9qqPQATivEGmo/88mrZSHa/7NN+Qmay2NAibUw+IWErbOC72EtC8ngZVN9LZDOAG6/b
 GaAOUC17/8qQ7VDicSxfLR4dvxpJdjiDqjrpNvCF3/ee6aF5v3N7OCRCC7wzd8BtpUKzIrW6
 uFIo1n/LmN93h3VkB07cHk/7vqkjtq/x5RYhbDreb/X6ENODuYpkJtvebw9R07RFo/Qm9suj
 53DKA8rg
Message-ID: <663abdbf-be58-c031-1b7c-b5070ec35491@gmail.com>
Date: Sun, 16 Feb 2020 11:25:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pkfWKaG_OZEPS5hWn=LU4H4zHM3fP3NXkbw5VYdQSbaw@mail.gmail.com>
X-Mailman-Approved-At: Sun, 23 Feb 2020 11:27:41 +0100
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8621922370437924714=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8621922370437924714==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="J11XDZJm5XsrtkvRLqpUqyrenrjwQ9wYT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--J11XDZJm5XsrtkvRLqpUqyrenrjwQ9wYT
Content-Type: multipart/mixed; boundary="0mHQZGPQehUDPf44RhYDWa4wcADKNbJ7o"

--0mHQZGPQehUDPf44RhYDWa4wcADKNbJ7o
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

What's stopping the GUI from being accessible via "Run as
administrator", though?


--0mHQZGPQehUDPf44RhYDWa4wcADKNbJ7o--

--J11XDZJm5XsrtkvRLqpUqyrenrjwQ9wYT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEysrPy4/39JJpWQvjrB2FpvudpmIFAl5JGIoACgkQrB2Fpvud
pmJHsw//fCZis3Hnwi9uT0mRHySMz2L6rZ4Bgeea59PyUCp4xyomQJ8ZChPIwlIU
Vfa5ResD2Ppf9WkiEkU4aZoTd4rWBvmQD6A4y9jtGBfhWViOXboejPeIG0GD/DCL
yPflNsBEh+03YTtRHae0UXq8LQ2zn+FRMrI/Xn4pPjZa4YKc4kelhDBMt/SjRjYb
qZ9qazPlVHxUTW0lunVlJz5vl+3bMLb+2FuUbIXSBY5Sr3qi8njmZgooyjC+0hKA
E3ciKx/IYv8BuGrxjeKDqHi7OURa7OZGAqXK8FfLmtrLEOLWHciRG4OlHEkiCumc
ra++S8ImhNL3WMJRVAAQPZNVrLhMZ6YinJASUPlWv8YrOl2YySsj8HfSw8hUkCyY
VIXZtidnqswTyhFtIfS8wqFtFyISPCwKyT5+sBqMESO1nKbUxy7lp58Bl9EaatSe
fmNZ76U552ldr68yD1t/r145JN43Kz5ilq92uDqzTc4FWkHiqb0tnUDGi45rkAtA
gM1ZOMbIYOWFqPdpEOs3rHpdbJMiiH95vKMZ/NsH/DU9e7hdBLOyGh2hSDE1A8b7
TNF+gvrjeCwe+qHQB8Z+9AOxx2CP0+3ua7ga4YFnFs+h70UEWbHQ4LNuuiS3bz1r
i9jlvFcZeCrUzNHcMw0xeQEeFeUZDgC+as9qkJGQN1rHdhi/cqg=
=OcYM
-----END PGP SIGNATURE-----

--J11XDZJm5XsrtkvRLqpUqyrenrjwQ9wYT--

--===============8621922370437924714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8621922370437924714==--

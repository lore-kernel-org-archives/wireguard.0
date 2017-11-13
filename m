Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e6bcd9a
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 09:08:52 +0000 (UTC)
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8b1b2f1
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 09:08:52 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id p9so12213162pgc.8
 for <wireguard@lists.zx2c4.com>; Mon, 13 Nov 2017 01:12:50 -0800 (PST)
Return-Path: <aaronmdjones@gmail.com>
Received: from ?IPv6:2001:470:6b50:a1::35? (saiga.home.exbit.io.
 [2001:470:6b50:a1::35])
 by smtp.gmail.com with ESMTPSA id c11sm15906590pgv.42.2017.11.13.01.12.48
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Nov 2017 01:12:48 -0800 (PST)
Subject: Re: only last configured peer has allowed-ips
To: wireguard@lists.zx2c4.com
References: <CAPayrd584iu0B=0ojTPdkZNQzwfCfE3SUcqst3NAHjw6efWqJQ@mail.gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <abcb09b1-b824-ba88-3ac1-ec38c9112d10@gmail.com>
Date: Mon, 13 Nov 2017 09:12:48 +0000
MIME-Version: 1.0
In-Reply-To: <CAPayrd584iu0B=0ojTPdkZNQzwfCfE3SUcqst3NAHjw6efWqJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

You cannot have more than one peer with the same AllowedIPs
entries. This is clearly documented on the "CryptoKey Routing"
section of the homepage. The reason is simple: when sending,
WireGuard would not know to which peer to send the traffic.

- -- 
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJaCWIOAAoJEIrwc3SIqzASMd4P/3JgXvsJ6iOK1LX+KMSt1htk
NF2FOek0084925vtJgPdJFhzxiyM23Xitwq0xFZcgMogRFkKB4anrJmeNoxu4hLr
z9JG3zJOIaQCPesIy2ta8y0JCPnphuL1ZbYQw434CzB/kcTPgEaSIklWSpvoD8AA
wQ2edvxzsgrY/1CRZIOf7yDVbrhaRnAVsnkHnbD0hBrTC6gWShP5T5vj5lH6ekL9
t86iQIOxq/0Ih2Umsa5ZWFpD+IJ4PtnAUfwvuz3hNtZ53HcC53T7QkLx5/oX0tvF
tOdkDb4TtbvAinE6Z3io2VIB3agDmKeJy0IcrQ0U4Y86LwhrrqGXak5JVw4T8yp4
BkD6Q0EtN+Lv5HNgLiv2S0siPyuXDt20pseBVAX3UxvU24+96ydYlm0m0LK74wgo
aWkoLptEroUqyFbirKKoC7BB8NUTt4U2J70D3qyDfmPSBy8WtQXwWH6mOZl1nwtq
WFEfpkkvwThucpdzXdFdGIAm1xXFYZqgIH6mO+FCQsAy6DQyluNa2UJj6gFHd5rR
MyrkjsI+IGETOXvvSn2+6rdvTK+B31CcvA0cH8+9jpmZt+6wwwgQmvOF/M1sYYHS
/OzOXBl1Z5uLsJ8O+8qnBJw1YFu4wZv1mZzEPE6rCvS2uU2mEhC0BXDmJGG+Bk1A
IY+7dg5HBe9AAOyw8k0p
=2QVh
-----END PGP SIGNATURE-----

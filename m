Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 676cb93f
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:03:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a3a8388
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:03:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d472ec45
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:03:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 93ca7d50
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:03:40 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f82so14699081wmf.1
 for <wireguard@lists.zx2c4.com>; Wed, 14 Dec 2016 13:10:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AD79A695-30E3-425D-9D7F-51AE2A25384D@danrl.com>
References: <AD79A695-30E3-425D-9D7F-51AE2A25384D@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Dec 2016 22:09:57 +0100
Message-ID: <CAHmME9pePj0thgb_NDVr_iN9rcvdwQMz=4_zRtP_57g=QO4_ow@mail.gmail.com>
Subject: Re: Structure(d) output of wg?
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Dan,

This already exists. While `wg show wg0` gives some hipster colorized
output, `wg show wg0 [CATEGORY]` gives very structured output meant
for parsing with bash or grep or sed or cut or whatever you want. For
example:

[zx2c4@demo ~]$ sudo wg show wg0 bandwidth | tail
l8gKhi5rvJChhDWHl+C7Ubj8hSHfW0HbkOOA9GQPL3Y=    13272   43056
CpX3sUNoLSofE6V6X+uHnFqF5+g/fXwJeY6ploPbgV0=    9425    5785
NkUUqbqhh+VV2IZYdAuVIdjpx0UopRRgO7hZju7+DW0=    145     89
S3/UokM7yvoKCYOvGdyi0IiiqvrUWXsIX8FTSFl0i2E=    46101   152415
FPqY/W8Z6LTgZLu69CqF1WtIPwUoG52pNNno4BRDtR0=    145     89
ULFNzzUznzXzMrjRvWUlz9dQsIzEAtIG7o3s9oHRJHk=    145     89
qbTrp7yhdqrvLnMg9kZNxNTd7FQRvV6jMr18G63zDhA=    13299   28787
p0rDK1UEx7siGp061hekJFYkjTs3qY08TBaTfSk86TM=    5075    3434
NZSZ7/JTraQ6eOseLIMQBo38cfQL8SXarfO/g99xYUI=    0       0
pX7cS/weolOD5GKHhrNqtqKT4nZto50ZXczacQ5iklM=    95210   58850

(Quit hoggin my bandwidth, yall ;-) )

Jason

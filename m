Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4196840
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 17:31:58 +0000 (UTC)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5212d48c
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 17:31:58 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id z3so7950650wme.3
 for <wireguard@lists.zx2c4.com>; Fri, 17 Nov 2017 09:36:28 -0800 (PST)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Roaming Mischief
To: Markus Woschank <markus.woschank@gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
 <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
 <CAKUy5axo5jO=6qv1XEsHvOUkcm6z7r4UW1hV+Oeomq_dJqQXJg@mail.gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <cdf48a39-3d81-5269-dbb4-93929cdf081f@gmail.com>
Date: Fri, 17 Nov 2017 17:36:26 +0000
MIME-Version: 1.0
In-Reply-To: <CAKUy5axo5jO=6qv1XEsHvOUkcm6z7r4UW1hV+Oeomq_dJqQXJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 17/11/17 17:23, Markus Woschank wrote:
> Please prove me wrong and supply an example where it makes sense
> to have a roaming peer's endpoint set, where the roaming peer
> _really_ roams (changes it's IP) and where on
> reboot/reset/whatsoever the originally set endpoint IP in the
> configuration magically makes any sense again.
> 
> Markus

"Originally" is the fallacy. wg-quick(8) can persist the current state
of the interface to the configuration file on shutdown, and restore it
on reboot. This is precisely what you would enable in an actual roaming
scenario.

Roaming means that the current endpoint (at shutdown time) would be
persisted, and if the reboot doesn't take very long, it is highly
likely that the (new) endpoint does still make sense, particularly
because UDP is used which means new sessions can usually resume as if
nothing happened, even through a NAT (though if you are also behind a
NAT, source port randomisation may trip you up if you don't have it
forwarded through the remote one, but that's beside the point).

- -- 
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJaDx4MAAoJEIrwc3SIqzAS36sQAK6RCyxC1QZROnrGT40YxjUq
cu/2yY/jUvyhN+O7vaPslw74A+DQGCmFyjSYjr7bw6zzS1fV0nH9IKa+3gRUmPke
Q9qEIdw+z39bNbpqWewBFYkIEBXj00/M50+CzWEKncrnbbAG8oUKxtM3sgjuNTpd
uDBe2yzxeYORkUt/WhFz4GR9bggmyNR8AzHBZ8MedSuceLgQQ+65G7+LZ2jixna+
3jpO7BGdQxM4hv+oTgHJ2IlTjK+LjCJ0HnR2j+sFas9KvZFXbNEi46bS3/+HZ8w5
fncVTZyh8Ez+GC6lCX4UfdMyTKc3U72XdL42LaoW+biketJ9S5GyY1MeDMVhtBWR
h/rO4aiRGZMUkxdpS4geUQ1tIPnLzIDN42tORrszE80o8Fd5iF/mj2IyXVRLkvj2
iyaERFeyTgKw3jvjPFKXeRjgUgGfwFtqpdA+ycXtI8heO/8GxZIqlrVwgpRyD/iA
JuCAucCF1HQtLJp51QfvJ3eEH2JmZvGgDk2COLhKt0hH6Wr4p/nDRasA9NS2HJEe
xJKKvERPTNSsmA+0a/WLRGrSPDxJJVLy0nQW9c/9dtwUZspUGJ7DHfSutCuShy6r
OSkTITSuZk7fjtEfVF1X7nV8F6GIVq8Xu7gk4B7EkekW6Z/QD9x7+PniLhjTkha7
+uGtIXqsnKaQ6miBKduu
=PxWC
-----END PGP SIGNATURE-----

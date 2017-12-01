Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f805aae8
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 23:44:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63ba215f
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 23:44:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c7638b5
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 23:44:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 15aa3132
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 23:44:02 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id e74so10434840ote.7
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 15:50:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qXr5aig-79MjuCbaTUPt2MEh+oAA53gpxOk999CsqKmw@mail.gmail.com>
References: <CAKgnZ5wDEwMXA6+WbxrmQocBgPPeHCH-WBdn5kHezzsLPGDdtQ@mail.gmail.com>
 <CAHmME9qXr5aig-79MjuCbaTUPt2MEh+oAA53gpxOk999CsqKmw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 2 Dec 2017 00:50:20 +0100
Message-ID: <CAHmME9o9pQdRdQ=7MqLYe1Yg8vxZNzAHd0ouRSq1Pwb9YYaHdg@mail.gmail.com>
Subject: Re: WireGuard (Android) Configuration issues, etc.
To: Jordan Johnston <johnstonljordan@gmail.com>
Content-Type: multipart/mixed; boundary="001a1148754014fca5055f50087d"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1148754014fca5055f50087d
Content-Type: text/plain; charset="UTF-8"

Hey again,

I'll update the demo.wireguard.com scripts in the repo in a bit to
make them slightly more simple and support v6, like the attached, but
thought you might benefit from this now.

zx2c4@thinkpad ~ $ ./client.sh > /etc/wireguard/demo.conf
zx2c4@thinkpad ~ $ wg-quick up demo
[#] ip link add demo type wireguard
[#] wg setconf demo /dev/fd/63
[#] ip address add 192.168.4.178/32 dev demo
[#] ip link set mtu 1420 dev demo
[#] ip link set demo up
[#] resolvconf -a tun.demo -m 0 -x
[#] wg set x fwmark 51820
[#] ip -4 route add 0.0.0.0/0 dev demo table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
zx2c4@thinkpad ~ $ curl -4 zx2c4.com/ip
163.172.161.0
demo.wireguard.com
curl/7.56.1

Please don't run the script more than once or twice or thrice.

Jason

--001a1148754014fca5055f50087d
Content-Type: application/x-sh; name="client.sh"
Content-Disposition: attachment; filename="client.sh"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jaok977h0

IyEvYmluL2Jhc2gKc2V0IC1lCnVtYXNrIDA3Nwpwcml2YXRlPSIkKHdnIGdlbmtleSkiCmV4ZWMg
Mzw+L2Rldi90Y3AvZGVtby53aXJlZ3VhcmQuY29tLzQyOTEyCndnIHB1YmtleSA8PDwiJHByaXZh
dGUiID4mMwpJRlM9OiByZWFkIC1yIHN0YXR1cyBzZXJ2ZXJfcHVia2V5IHNlcnZlcl9wb3J0IGlu
dGVybmFsX2lwIDwmMwpbWyAkc3RhdHVzID09IE9LIF1dCmNhdCA8PC1fRU9GCglbSW50ZXJmYWNl
XQoJQWRkcmVzcyA9ICRpbnRlcm5hbF9pcC8zMgoJUHJpdmF0ZUtleSA9ICRwcml2YXRlCglETlMg
PSA4LjguOC44LCA4LjguNC40CgoJW1BlZXJdCglQdWJsaWNLZXkgPSAkc2VydmVyX3B1YmtleQoJ
RW5kcG9pbnQgPSBkZW1vLndpcmVndWFyZC5jb206JHNlcnZlcl9wb3J0CglBbGxvd2VkSVBzID0g
MC4wLjAuMC8wCl9FT0YK
--001a1148754014fca5055f50087d--

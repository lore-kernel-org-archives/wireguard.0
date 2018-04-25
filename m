Return-Path: tom@tigera.io
MIME-Version: 1.0
From: Tom Denham <tom@tigera.io>
Date: Wed, 25 Apr 2018 10:54:06 -0700
Message-ID: <CAJ5-c6WjxshZF7sE98Sk8XYr=9o5vRAiLQ+xCwq2Nidt8iPU8g@mail.gmail.com>
Subject: Using WireGuard with Kubernetes
To: WireGuard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="00000000000043bb90056aaff6ce"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000043bb90056aaff6ce
Content-Type: text/plain; charset="UTF-8"

I was wondering if anyone had any experience using WireGuard with
Kubernetes? I see that the WireGuard website says "Ready for Containers"
but the model it describes sounds like it would work for adding WireGuard
to a single container (putting the wg interface in the container itself).
If I have many containers on a host, and many containers on a host, and I
want them all to be able to communicate with each other using WireGuard,
then I would need to create many different WireGuard interfaces and
presumably they would all need their own independent config. It doesn't
feel like this would scale to 100's of hosts and tens of thousands of
containers.

I'm interested in hearing people's thoughts and ideas on this
Thanks
Tom

--00000000000043bb90056aaff6ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was wondering if anyone had any experience using WireGua=
rd with Kubernetes? I see that the WireGuard website says &quot;Ready for C=
ontainers&quot; but the model it describes sounds like it would work for ad=
ding WireGuard to a single container (putting the wg interface in the conta=
iner itself). If I have many containers on a host, and many containers on a=
 host, and I want them all to be able to communicate with each other using =
WireGuard, then I would need to create many different WireGuard interfaces =
and presumably they would all need their own independent config. It doesn&#=
39;t feel like this would scale to 100&#39;s of hosts and tens of thousands=
 of containers.<div><br></div><div>I&#39;m interested in hearing people&#39=
;s thoughts and ideas on this</div><div>Thanks</div><div>Tom</div></div>

--00000000000043bb90056aaff6ce--

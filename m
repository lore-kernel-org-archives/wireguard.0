Return-Path: saeidscorp@yahoo.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e98c820
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 14:45:29 +0000 (UTC)
Received: from nm48-vm4.bullet.mail.bf1.yahoo.com
 (nm48-vm4.bullet.mail.bf1.yahoo.com [216.109.115.159])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01f73014
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Apr 2017 14:45:29 +0000 (UTC)
Date: Sun, 23 Apr 2017 19:23:46 +0430
Subject: Issue, WireGuard on a PaX kernel
Message-ID: <wexyqgwcryb4usbwj8td1g9m.1492956648412@email.android.com>
From: saeidscorp <saeidscorp@yahoo.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--_com.samsung.android.email_2310878862867500"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

----_com.samsung.android.email_2310878862867500
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgZXZlcnlib2R5LApJJ3ZlIGJlZW4gaGF2aW5nIHRyb3VibGVzIHVzaW5nIFdpcmVHdWFyZCBv
biBHZW50b28gaGFyZGVuZWQvUGFYIGtlcm5lbC4gSSBoYXZlIHNldCB1cCBXaXJlR3VhcmQgb24g
cmVndWxhciBrZXJuZWxzIHNldmVyYWwgdGltZXMsIGJ1dCBvbiBhIFBhWCBrZXJuZWwgaXQgY2F1
c2VzIHRoZSBrZXJuZWwgdG8gcGFuaWMuCkFsbCBzdGVwcyBvZiBpbmV0cmZhY2UgYWRkaXRpb24g
YW5kIGNvbmZpZ3VyYXRpb24gdXNpbmcgd2cgdG9vbCB3b3JrIHdlbGwsIGJ1dCBhcyBzb29uIGFz
IHRoZSBmaXJzdCBwYWNrZXQgZ29lcyB0aHJvdWdoIHRoZSBpbnRlcmZhY2UsIGl0IGNyYXNoZXMg
dGhlIHdob2xlIHN5c3RlbS4KSSB0cmllZCBhZGRpbmcgd2lyZWd1YXJkIHRvIHRoZSBrZXJuZWwg
dHJlZSwgYm90aCBhcyBidWlsdC1pbiBhbmQgYXMgYSBtb2R1bGUsIGVuYWJsZWQgdmVyYm9zZSBt
ZXNzYWdlcyBpbiBrY29uZmlnLCBidXQgZG9uJ3Qga25vdyB3aGVyZSB0byBhY3R1YWxseSBsb29r
IGZvciBpdHMgbG9nIG91dHB1dCEgKE5vIGV2aWRlbmNlIG9mIHdpcmVndWFyZCBtZXNzYWdlcyBp
biBkbWVzZyBvciBzeXNsb2cpCkNvdWxkIHlvdSBwbGVhc2UgcG9pbnQgbWUgaW4gdGhlIHJpZ2h0
IGRpcmVjdGlvbj8hCkZZSSwgSXQncyBydW5uaW5nIGluc2lkZSBhIFZNd2FyZSBWUFMgYW5kIFBh
WCBpcyB1c2luZyBzbG93IFVERVJFRi4KVGhhbmtzLg==

----_com.samsung.android.email_2310878862867500
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPjwvaGVhZD48Ym9keT5IaSBldmVyeWJvZHksPGRpdj48YnI+
PC9kaXY+PGRpdj5JJ3ZlIGJlZW4gaGF2aW5nIHRyb3VibGVzIHVzaW5nIFdpcmVHdWFyZCBvbiBH
ZW50b28gaGFyZGVuZWQvUGFYIGtlcm5lbC4gSSBoYXZlIHNldCB1cCBXaXJlR3VhcmQgb24gcmVn
dWxhciBrZXJuZWxzIHNldmVyYWwgdGltZXMsIGJ1dCBvbiBhIFBhWCBrZXJuZWwgaXQgY2F1c2Vz
IHRoZSBrZXJuZWwgdG8gcGFuaWMuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BbGwgc3RlcHMg
b2YgaW5ldHJmYWNlIGFkZGl0aW9uIGFuZCBjb25maWd1cmF0aW9uIHVzaW5nIHdnIHRvb2wgd29y
ayB3ZWxsLCBidXQgYXMgc29vbiBhcyB0aGUgZmlyc3QgcGFja2V0IGdvZXMgdGhyb3VnaCB0aGUg
aW50ZXJmYWNlLCBpdCBjcmFzaGVzIHRoZSB3aG9sZSBzeXN0ZW0uPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5JIHRyaWVkIGFkZGluZyB3aXJlZ3VhcmQgdG8gdGhlIGtlcm5lbCB0cmVlLCBib3Ro
IGFzIGJ1aWx0LWluIGFuZCBhcyBhIG1vZHVsZSwgZW5hYmxlZCB2ZXJib3NlIG1lc3NhZ2VzIGlu
IGtjb25maWcsIGJ1dCBkb24ndCBrbm93IHdoZXJlIHRvIGFjdHVhbGx5IGxvb2sgZm9yIGl0cyBs
b2cgb3V0cHV0ISAoTm8gZXZpZGVuY2Ugb2Ygd2lyZWd1YXJkIG1lc3NhZ2VzIGluIGRtZXNnIG9y
IHN5c2xvZyk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkNvdWxkIHlvdSBwbGVhc2UgcG9pbnQg
bWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbj8hPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5GWUks
IEl0J3MgcnVubmluZyBpbnNpZGUgYSBWTXdhcmUgVlBTIGFuZCBQYVggaXMgdXNpbmcgc2xvdyBV
REVSRUYuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MuPC9kaXY+PC9ib2R5PjwvaHRt
bD4=

----_com.samsung.android.email_2310878862867500--

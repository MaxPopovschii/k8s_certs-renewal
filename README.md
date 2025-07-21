# 📜 Kubeadm: Rigenerazione dei Certificati con Durata di 5 Anni

Questa guida ti aiuta a rigenerare tutti i certificati interni del tuo cluster Kubernetes creato con `kubeadm`, estendendone la durata a **5 anni** (43800 ore).

---

## ⚠️ Avvertenze Preliminari

* Operazione valida solo per cluster **creati con `kubeadm`**.
* Consigliata in ambienti **di test** o **single-node**.
* In produzione è necessario un piano più strutturato.
* Fai sempre un **backup completo** dei certificati e dei file `.conf` prima di procedere.

---

## 🧪 1. Backup Certificati

```bash
sudo mkdir -p /root/k8s-certs-backup-$(date +%Y%m%d)
sudo cp -r /etc/kubernetes/pki /root/k8s-certs-backup-$(date +%Y%m%d)/
sudo cp /etc/kubernetes/*.conf /root/k8s-certs-backup-$(date +%Y%m%d)/
```

---

## 📝 2. File di Configurazione Personalizzato

Crea un file `kubeadm-5y-certs.yaml` con questo contenuto:

```yaml
apiVersion: kubeadm.k8s.io/v1beta3
kind: ClusterConfiguration
certificatesDir: /etc/kubernetes/pki
clusterName: kubernetes
apiServer:
  certSANs:
    - "localhost"
    - "127.0.0.1"
    - "kubernetes"
    - "kubernetes.default"
    - "kubernetes.default.svc"
    - "kubernetes.default.svc.cluster.local"
controllerManager: {}
scheduler: {}
---
apiVersion: kubeadm.k8s.io/v1beta3
kind: InitConfiguration
localAPIEndpoint:
  advertiseAddress: "127.0.0.1"
  bindPort: 6443
```

---

## 🔁 3. Rigenerazione dei Certificati (Durata: 5 Anni)

```bash
sudo kubeadm init phase certs all --config kubeadm-5y-certs.yaml --cert-expiry 43800h
```

---

## 📂 4. Rigenerazione File Kubeconfig

```bash
sudo kubeadm init phase kubeconfig all --config kubeadm-5y-certs.yaml
```

---

## ✅ 5. Verifica Scadenza Certificati

```bash
sudo kubeadm certs check-expiration
```

Dovresti vedere una scadenza a **+5 anni** da oggi.

---

## 🔄 6. Riavvio del Kubelet (opzionale)

```bash
sudo systemctl restart kubelet
```

Oppure modifica un commento nei manifest statici per forzare il restart:

```bash
sudo nano /etc/kubernetes/manifests/kube-apiserver.yaml
# Aggiungi un commento per far rileggere il file
```

---

## 🧹 7. Cleanup Finale (facoltativo)

Elimina i backup se tutto funziona correttamente:

```bash
sudo rm -rf /root/k8s-certs-backup-*
```

---

## ✅ Fine

Hai aggiornato con successo i certificati del tuo cluster Kubernetes con una durata di 5 anni!
